# Maintainer: Karthik Jayakumar <valliyilkarthik@gmail.com>

pkgname=qsc-cli
pkgver=1.28.3
pkgrel=1
pkgdesc="Qualcomm Software Center CLI, with QIK and the QSC desktop app"
arch=('x86_64')
url="https://softwarecenter.qualcomm.com/"
license=('LicenseRef-Qualcomm' 'MIT' 'Apache-2.0')
depends=(
  # qsc-cli, qik and the libraries bundled for tools QSC installs
  'bash'
  'ca-certificates'
  'e2fsprogs'
  'fontconfig'
  'glibc'
  'gnutls'
  'icu'
  'libgcc'
  'libsasl'
  'libstdc++'
  'libxcrypt-compat'
  'openssl'
  'polkit'
  'sqlite'
  'sudo'
  'util-linux-libs'
  'xdg-utils'
  'zlib'
  # Desktop app (Electron)
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'gtk3'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
makedepends=('patchelf' 'perl')
# Upstream's dependencies_installer.sh apt-installs these for chip-software
optdepends=('android-tools: adb and fastboot for chip-software device and flash'
            'docker: chip-software compile and open-build-env run in containers'
            'git: workspace setup for chip-software compile'
            'python: build scripts run by chip-software compile'
            'unzip: unpacking downloaded builds')
conflicts=('qualcomm-software-center' 'qualcommsoftwarecenter')
options=('!strip' '!debug')  # Node SEA and .NET single-file binaries carry appended payloads
install=$pkgname.install
source=("$pkgname-$pkgver.deb::https://softwarecenter.qualcomm.com/api/download/software/tools/Qualcomm_Software_Center/Linux/Debian/$pkgver/QualcommSoftwareCenter$pkgver.Linux-x86.deb"
        LICENSE.Qualcomm
        $pkgname.tmpfiles)
noextract=("$pkgname-$pkgver.deb")
sha256sums=('b53377df60621c9660a42f1e91f0b3d1453002a59c43cbd9976cacadc6dfa95b'
            '5a3947b37a2f86749407785914abca3d1befcecb3a45d3767e2e41cdcb33af8c'
            'deb6336a82682c896075aa383ba0cb7bd99c3318624c96ad9eaf67f4ce38295b')

_bin=/opt/qcom/softwarecenter/bin
_deps=/opt/qcom/tools-common/libs/system-deps  # RUNPATH of the bundled libs

# Replace one exact byte string with another of the same length, so offsets
# inside single-file executables stay valid
_patch_bytes() {
  perl -0777 -pi -e '
    BEGIN { ($o, $n) = splice @ARGV, 0, 2; length($o) == length($n) or die "length mismatch\n" }
    ($c = s/\Q$o\E/$n/g) == 1 or die "expected 1 match, found " . ($c || 0) . "\n";
  ' "$2" "$3" "$1"
}

prepare() {
  rm -rf deb && mkdir -p deb/control
  bsdtar -xOf "$pkgname-$pkgver.deb" 'control.tar.*' | bsdtar -xf - -C deb/control
  bsdtar -xOf "$pkgname-$pkgver.deb" 'data.tar.*' | bsdtar -xf - -C deb

  local _ver
  _ver=$(sed -n 's/^Version: //p' deb/control/control)
  if [[ $_ver != "$pkgver" ]]; then
    error "The .deb is QSC $_ver, not $pkgver"
    return 1
  fi

  cd "deb$_bin"

  # Arch's /etc/os-release has no VERSION_ID, which makes every qsc-cli command
  # (even --version) and the desktop app's server throw at startup. Fall back to
  # "", which makes them leave the host OS filter out of backend queries.
  # qsc-cli is a Node SEA binary, so its embedded JS is patched in place; the
  # shorter quote-stripping regex makes room for the fallback.
  _patch_bytes qsc-cli/qsc-cli \
    'distribution:t.get("NAME").replace(/^"|"$/g,""),version:t.get("VERSION_ID").replace(/^"|"$/g,"")' \
    'distribution:t.get("NAME").replace(/"/g,""),version:(t.get("VERSION_ID")||"").replace(/"/g,"")  '
  sed -i 's/osReleaseInfoMap\.get("VERSION_ID")\.replace/(osReleaseInfoMap.get("VERSION_ID") || "").replace/' \
    resources/app/dist/start-server.js
  if grep -q 'version: osReleaseInfoMap\.get("VERSION_ID")' resources/app/dist/start-server.js; then
    error "start-server.js VERSION_ID patch did not apply"
    return 1
  fi

  # qik's RUNPATH starts with /tmp/qikv3sfx, where any local user could plant
  # libraries that load when qik runs as root. Drop it; the shorter RUNPATH is
  # rewritten in place, which keeps the .NET single-file bundle intact.
  local _size
  _size=$(stat -c %s qik/qik)
  patchelf --set-rpath /opt/qcom/tools-common/libs/openssl3.0.0:$_deps/ qik/qik
  if [[ $(stat -c %s qik/qik) != "$_size" ]]; then
    error "patchelf resized qik"
    return 1
  fi
}

build() {
  # The bundled libldap needs libsasl2.so.2 with symbol version SASL2. Arch
  # ships the same library as libsasl2.so.3 without versioning, so this stub
  # defines SASL2 and pulls in the real library, where the symbols then resolve
  # (a plain symlink works too, but warns on every run).
  echo 'SASL2 { local: *; };' > sasl2.map
  gcc -shared -o libsasl2.so.2 -Wl,-soname,libsasl2.so.2 \
    -Wl,--version-script=sasl2.map -x c /dev/null -Wl,--no-as-needed -lsasl2

  # QIK's record of QSC itself, as upstream's postinst writes it; the install
  # scriptlet copies it into /var/lib/qcom/data/qik/components
  local _date
  _date=$(date -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" '+%Y-%m-%d %H:%M:%S')
  cat > qikcomponent_abc31016-7831-11ee-b4ae-026b10d3716b.dat <<EOF
{"Branch":null,"ComponentID":"abc31016-7831-11ee-b4ae-026b10d3716b","ComponentName":"Qualcomm_Software_Center.Core","ComponentType":"Core","DependsOn":null,"Description":"Qualcomm_Software_Center.Core","FeatureID":"ab64288f-7831-11ee-b4ae-026b10d3716b","FeatureName":"Core","GUID":"3b59d03c-d624-4c78-ad52-a516b8ec85b4","InstallLocation":"\/opt\/qcom\/softwarecenter\/bin","InstallLocationRoot":"\/opt\/qcom\/softwarecenter","InstallationDate":"$_date","MultipleVersions":0,"Name":"Qualcomm® Software Center","ProductID":"ab2423ae-7831-11ee-b4ae-026b10d3716b","ProductName":"Qualcomm_Software_Center","PublishedDate":"2024-02-23 13:31:44","Publisher":"Qualcomm Technologies, Inc.","ReferenceCounter":0,"RequiredBy":null,"SpaceReq":"","Subtitle":"Qualcomm® Software Center","Version":"$pkgver","packageFile":""}
EOF
}

package() {
  local _deb="$srcdir/deb"

  install -d "$pkgdir/opt/qcom"
  cp -a --no-preserve=ownership "$_deb/opt/qcom/softwarecenter" "$pkgdir/opt/qcom/"
  # OpenSSL 3.0.0 copy that nothing loads; everything uses the system libcrypto
  rm "$pkgdir$_bin"/qik/lib{ssl,crypto}.so.3

  # Libraries for tools that QSC installs, which look in either directory.
  # The bundled OpenSSL 3.0.0 is left out here too.
  install -Dm755 "$_deb"/tmp/qcom/qsc_installer/external-dependencies/libs/system-deps/* \
    "$srcdir/libsasl2.so.2" -t "$pkgdir$_deps/"
  install -d "$pkgdir/opt/qcom/QPM3/bin"
  ln -s "$_deps" "$pkgdir/opt/qcom/QPM3/bin/system-deps"

  install -d "$pkgdir/opt/qcom/qik3/bin"
  ln -s "$_bin/qik/qik" "$pkgdir/opt/qcom/qik3/bin/qik"

  install -d "$pkgdir/usr/bin"
  ln -s "$_bin/qsc-cli/qsc-cli.sh" "$pkgdir/usr/bin/qsc-cli"
  ln -s "$_bin/qik/qik" "$pkgdir/usr/bin/qikv3"  # the desktop app looks for qikv3 in /usr/bin

  install -Dm644 "$srcdir"/qikcomponent_*.dat -t "$pkgdir/usr/share/$pkgname/qik-components/"
  install -Dm644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  install -Dm644 "$_deb/usr/share/applications/qualcommsoftwarecenter.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$_deb/usr/share/pixmaps/qualcommsoftwarecenter.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 "$_deb/usr/share/doc/softwarecenter/NOTICE.txt" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$_deb/usr/share/doc/softwarecenter/html/license.html" -t "$pkgdir/usr/share/doc/$pkgname/html/"

  install -Dm644 "$srcdir/LICENSE.Qualcomm" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$_deb$_bin/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron"
  install -Dm644 "$_deb/opt/qcom/softwarecenter/cosign/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.cosign"
  ln -s "$_bin/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/"
}
