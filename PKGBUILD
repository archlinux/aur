# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=cronopete-bin
pkgver=5.1.1
pkgrel=1
pkgdesc="A graphical backup utility based on Apple Time Machine idea."
arch=('x86_64')
url="https://www.rastersoft.com/programas/cronopete.html"
license=('GPL-3.0-or-later')
provides=('cronopete')
conflicts=('cronopete')
# rsync and udisks2 are core runtime requirements, not optional extras.
# gcc-libs is kept intentionally because the upstream binary links libgcc_s/libstdc++.
depends=('dconf' 'gcc-libs' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libgee' 'libnotify' 'rsync' 'udisks2')
options=('!strip' '!debug')
source=("cronopete-${pkgver}-1-x86_64.pkg.tar.zst::https://www.rastersoft.com/descargas/cronopete/cronopete-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('a63701e6aa753596b55da557b5e76822cef0960c504f9a655e7bd5cef9889cae')

latestver() {
  # The Arch download link is the version source rather than the page's own
  # "version:" text, which is bumped when a release is announced and can sit
  # ahead of the artifact. Upstream renames the file on every rebuild, so the
  # build counter between the version and the architecture is matched
  # generically: pinning it makes the version undetectable as soon as they
  # republish without changing the version.
  curl -fsSL "${url}" |
    grep -oP 'cronopete-\K[0-9]+(\.[0-9]+)+(?=-[0-9]+-x86_64\.pkg\.tar\.zst)' |
    sort -V | tail -1
}

package() {
  bsdtar -xf "${srcdir}/cronopete-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}"

  rm -f "${pkgdir}/.BUILDINFO" "${pkgdir}/.MTREE" "${pkgdir}/.PKGINFO"
}
