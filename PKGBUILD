# Maintainer: 9M2PJU <9m2pju@gmail.com>
# AUR package for AutoMorph (git snapshot). Release tarballs are published
# as .deb/.rpm/.AppImage — see packaging/install.sh for those.
pkgname=automorph-git
_pkgbase=automorph
pkgver=r32.5b79369
pkgrel=1
pkgdesc="Self-hosted tool for automatically patching and distributing Android packages (Morphe Desktop)"
arch=('x86_64' 'aarch64')
url="https://github.com/holjab/AutoMorph"
license=('MIT')
depends=('python>=3.12' 'jre21-openjdk-headless' 'curl' 'ca-certificates')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase" "$_pkgbase-bin")
install=$pkgname.install
_morphever=1.19.0
source=("git+https://github.com/9M2PJU/AutoMorph.git"
        "morphe-desktop-${_morphever}-all.jar::https://github.com/MorpheApp/morphe-desktop/releases/download/v${_morphever}/morphe-desktop-${_morphever}-all.jar")
sha256sums=('SKIP'
            'deb5d931f3899b20a119637473d338c52585f0c561b5d8b2856b916fe90163b5')

pkgver() {
  cd "$srcdir/AutoMorph"
  # Fallback scheme when no tags exist yet; switches to git describe once tagged.
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
  cd "$srcdir/AutoMorph"
  install -dm755 "$pkgdir/opt/automorph/tools" \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/systemd/system" \
    "$pkgdir/usr/share/doc/$_pkgbase"

  cp -r scripts web defaults "$pkgdir/opt/automorph/"
  install -Dm644 requirements.txt "$pkgdir/opt/automorph/requirements.txt"
  install -Dm644 LICENSE "$pkgdir/opt/automorph/LICENSE"
  install -Dm755 packaging/automorph "$pkgdir/usr/bin/automorph"
  install -Dm644 packaging/automorph.service "$pkgdir/usr/lib/systemd/system/automorph.service"
  install -Dm644 example.env "$pkgdir/usr/share/doc/$_pkgbase/example.env"
  install -Dm644 "$srcdir/morphe-desktop-${_morphever}-all.jar" \
    "$pkgdir/opt/automorph/tools/morphe-desktop-${_morphever}-all.jar"
  ln -s "morphe-desktop-${_morphever}-all.jar" "$pkgdir/opt/automorph/tools/morphe.jar"

  # Stamp the web UI version with the AUR pkgver
  printf '{"version":"%s-%s","branch":"git","commit":"%s"}\n' \
    "$pkgver" "$pkgrel" "$pkgver" > "$pkgdir/opt/automorph/web/version.json"
}
