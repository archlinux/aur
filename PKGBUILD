# Maintainer: Xavier Góngora <ixbalanque at protonmail dot ch>

_appname=extempore
pkgname=$_appname-bin
pkgver=0.11.2
pkgrel=1
pkgdesc="A cyber-physical programming environment"
arch=('x86_64')
url="https://github.com/digego/${_appname}"
license=('LicenseRef-extempore')
groups=('pro-audio')
depends=('alsa-lib')
provides=('extempore')
conflicts=('extempore')
source=(
  "${url}/releases/download/v${pkgver}/${_appname}-linux-${arch}-v${pkgver}.zip"
  LICENSE
  extempore.sh
)
sha256sums=('c180fc1493816aec5ac80b4ebce20f93f6d83db6615ad09772c05638e415db6c'
  'f4bd232731cf4d4ddc82026b26a6e08736c2f5e8770078f69a864d9a45bec070'
  '68d567be326d523dc08e9f0359fed59e40bece6366a02165207e22d00502b276')

package() {
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "${pkgdir}/opt/${pkgname}"
  # cp -a ("archive mode") copies recursively while preserving permissions, timestamps, and symlinks
  # important here because the release bundle likely has symlinks and pre-set executable bits that a
  # plain cp -r would flatten or reset.
  cp -a "${srcdir}/${_appname}-linux-${arch}-v${pkgver}/." "$pkgdir/opt/${pkgname}/"
  # Make sure the binary is executable (safety measure)
  chmod +x "${pkgdir}/opt/${pkgname}/${_appname}"

  # Substitute the install path into the wrapper script at build time.
  sed "s|@INSTALLDIR@|/opt/${pkgname}|" "${srcdir}/extempore.sh" |
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/extempore"
}
