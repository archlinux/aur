# Maintainer: Dirk Wouters <info@dirkwouters.de>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ivan Agarkov <ivan.agarkov@gmail.com>

pkgname=heli-x
pkgver=11.0.2675
pkgrel=2
pkgdesc='Professional R/C Flight Simulator'
arch=('x86_64')
url='https://www.heli-x.info'
license=('LicenseRef-HELI-X')
depends=('hicolor-icon-theme' 'xdg-utils' 'bash' 'coreutils')
makedepends=('icoutils')
options=('!strip')
source=(
  "$pkgname-$pkgver.tar.gz::$url/${pkgver##*.}/HELI-X${pkgver%%.*}.tar.gz"
  "$pkgname-$pkgver-manual_de.pdf::$url/help${pkgver%%.*}/BedienungsanleitungV${pkgver%%.*}.pdf"
  "$pkgname-$pkgver-manual_en.pdf::$url/help${pkgver%%.*}/UsersManualV${pkgver%%.*}.pdf"
)
sha512sums=(
  '1f6124ae88b018741942dceb70428ff8bc6a5e20b5716a5d4aa71e3207ba87904b0ddbb878c8b45e95f0d82472e1da089735b929361227862209c0ce7029f591'
  '437439178d651e9693bb08d433043a302436bc0e2484b02f4e9326326b26bcf4af0576c30f119b83a5ac7613ed21927f6a40bdaa792d4bb949ee95b216512b57'
  '96605160f4e10c07ec062d3f7bdf820813b06a70bb8d5fd3ddfe43165dc0e7764ff211190ae1166fcf47403d3c106bea10805bb98688f480986d43eb3f1f1e1d'
)

prepare() {
  cd "$srcdir/HELI-X${pkgver%%.*}" || return 1
  local script
  for script in runHELI-X.sh runHELI-X-Server.sh; do
    [[ -f $script ]] || { printf 'Missing launcher: %s\n' "$script" >&2; return 1; }
    grep -qF './Java/jre21/bin/java' "$script" || { printf 'Unexpected Java command in %s\n' "$script" >&2; return 1; }
    sed -i 's|./Java/jre21/bin/java|./Java/jre21/bin/java --enable-native-access=ALL-UNNAMED -DheliX.path.home="$HOME/.heli-x"|' "$script"
    # All vendor JAR replacement operations must target the writable user directory.
    sed -i 's|"$PWD/libs/HeliX/|"$HELIX_USER_JARS/|g' "$script"
  done

  sed -i 's/ -XX:InitiatingHeapOccupancyPercent=70//g' runHELI-X.sh
  # The upstream classpath uses $JARPATH, not $PWD/libs/HeliX.
  # Redirect only the four mutable vendor JARs to the user-owned copies.
  sed -i \
    -e 's|$JARPATH/HeliX/HeliX11.jar|$HELIX_USER_JARS/HeliX11.jar|g' \
    -e 's|$JARPATH/HeliX/Translation.jar|$HELIX_USER_JARS/Translation.jar|g' \
    -e 's|$JARPATH/HeliX/Media.jar|$HELIX_USER_JARS/Media.jar|g' \
    runHELI-X.sh
  # The classpath entry for the main application must use the personal JAR.
  grep -qF 'CP="$CP:$HELIX_USER_JARS/HeliX11.jar"' runHELI-X.sh || {
    printf 'Main JAR classpath replacement failed\n' >&2; return 1;
  }
  # Server JAR is also user-writable; all other resources remain in /opt.
  grep -qF 'JARPATH="$HELIX_USER_JARS/server.jar"' runHELI-X-Server.sh || {
    printf 'Server JAR replacement failed\n' >&2; return 1;
  }
  sed -i 's|--dataDir ./files/server|--dataDir "$HOME/.heli-x/files/server"|' runHELI-X-Server.sh
  sed -i 's/"Session"--gui/"Session" --gui/g' runHELI-X-Server.sh
  sed -i '/^\.\/Java\/jre21\/bin\/java /i mkdir -p "$HOME/.heli-x/files/server"' runHELI-X-Server.sh

  local flightdir='resources/flights/Heli_School/Piro_Tic_Tocs_Demo'
  if [[ -f "$flightdir/Piro_Tic_Tocs_Demo.fly" && ! -e "$flightdir/Piro_Tic_Tocs_demo.fly" ]]; then
    ln -s Piro_Tic_Tocs_Demo.fly "$flightdir/Piro_Tic_Tocs_demo.fly"
  fi
}

package() {
  install -dm755 "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/HELI-X${pkgver%%.*}/." "$pkgdir/opt/$pkgname/"
  chmod 755 "$pkgdir/opt/$pkgname/runHELI-X.sh" \
            "$pkgdir/opt/$pkgname/runHELI-X-Server.sh" \
            "$pkgdir/opt/$pkgname/Java/jre21/bin/java" \
            "$pkgdir/opt/$pkgname/Java/jre21/lib/jspawnhelper"
  # Correct upstream's permissive directory modes, without touching file modes.
  find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +

  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/heli-x" <<'WRAPPER'
#!/usr/bin/env bash
set -e
install_dir=/opt/heli-x
state_dir="${XDG_DATA_HOME:-$HOME/.local/share}/heli-x"
jar_dir="$state_dir/libs/HeliX"
mkdir -p "$jar_dir"

# Never overwrite an activated JAR, including on package upgrades.
# To adopt new vendor JARs, the user must explicitly reset/migrate them.
for jar in HeliX11.jar Translation.jar Media.jar server.jar; do
  if [[ ! -e "$jar_dir/$jar" ]]; then
    cp "$install_dir/libs/HeliX/$jar" "$jar_dir/$jar"
  fi
done

export HELIX_USER_JARS="$jar_dir"
if [[ ${1:-} == --server || ${0##*/} == heli-x-server ]]; then
  shift
  exec "$install_dir/runHELI-X-Server.sh" "$@"
fi
exec "$install_dir/runHELI-X.sh" "$@"
WRAPPER
  chmod 755 "$pkgdir/usr/bin/heli-x"
  ln -s heli-x "$pkgdir/usr/bin/heli-x-server"

  install -dm755 "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/heli-x.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=HELI-X
Comment=Professional R/C Flight Simulator
Exec=heli-x
Icon=heli-x
Terminal=false
Categories=Game;Simulation;
DESKTOP
  cat > "$pkgdir/usr/share/applications/heli-x-server.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=HELI-X Server
Comment=HELI-X Simulator Server
Exec=heli-x --server
Icon=heli-x
Terminal=true
Categories=Game;Simulation;
DESKTOP

  cd "$srcdir" || return 1
  icotool -x "HELI-X${pkgver%%.*}/runHELI-X.ico" || return 1
  local res
  local -a icons
  for res in 16 32 48 128 256; do
    icons=(runHELI-X_*_"${res}x${res}x32.png")
    if (( ${#icons[@]} != 1 )) || [[ ! -f ${icons[0]} ]]; then
      printf 'Expected exactly one %sx%s icon\n' "$res" "$res" >&2
      return 1
    fi
    install -Dm644 "${icons[0]}" "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname-$pkgver-manual_en.pdf" "$pkgdir/usr/share/doc/$pkgname/manual_en.pdf"
  install -Dm644 "$srcdir/$pkgname-$pkgver-manual_de.pdf" "$pkgdir/usr/share/doc/$pkgname/manual_de.pdf"
  local helidir="$srcdir/HELI-X${pkgver%%.*}"
  install -Dm644 "$helidir/libs/HeliX/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 "$helidir/libs/HeliX/license_e.txt" "$pkgdir/usr/share/licenses/$pkgname/license_e.txt"
}

# vim:set ts=2 sw=2 et:
