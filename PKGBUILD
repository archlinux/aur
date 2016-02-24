# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Andrew Kelley <superjoe30@gmail.com>
# Contributor: superjoe <superjoe30@gmail.com>
#
# makepkg warns "Package contains reference to $pkgdir". This is OK. See:
# https://github.com/andrewrk/groovebasin/issues/214

pkgname=nodejs-groovebasin-git
_pkgname=groovebasin
pkgver=1.5.1.43.ge165f9a
pkgrel=1
pkgdesc='Music player server with a web-based user interface inspired by Amarok 1.4'
arch=('i686' 'x86_64')
url='http://groovebasin.com/'
license=(MIT)
depends=(nodejs libgroove)
makedepends=(python2)
provides=(nodejs-groovebasin)
conflicts=(nodejs-groovebasin)
backup=('etc/groovebasin.json')
install=groovebasin.install
source=("$_pkgname"::"git+https://github.com/andrewrk/${_pkgname}#branch=libgroove-master"
        groovebasin.sh
        groovebasin.json
        groovebasin.service
        groovebasin-groove-git.patch)
sha256sums=('SKIP'
            '5169f64bbe305959d6c2c76f73b10c3a604586cb884c78e9b620e476f45132df'
            '55ec9f96e6ad4d8cf478f34a48a5ce98cf6150374b82cbc46cb07696370ee33d'
            'fca2b5d94cef9e5b70936bdb47c4a69724050d657fe72f471f989dce933a1caa'
            '19729298fec852d741b85f7538438395b0ef7552b70eee8a1395d2ab30c28194')


kgver() {
  cd "${srcdir}/${_pkgname}"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -fNp1 -i ../groovebasin-groove-git.patch
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm \
    --python=python2 \
    run build
}

package() {
  npm \
    --python=python2 \
    install \
    --user root \
    --global \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgname}"

  # fix directory permissions
  chmod 0755 \
    "${pkgdir}/usr" \
    "${pkgdir}/usr/lib/node_modules"

  # music dir
  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"

  # bindings
  install -Dm644 \
    "${srcdir}/${_pkgname}/node_modules/groove/build/Release/groove.node" \
    "${pkgdir}/usr/lib/node_modules/groovebasin/node_modules/groove/build/groove.node"


  install -Dm755 "${srcdir}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d -g 49 -o 49 "${pkgdir}/var/lib/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.json" "${pkgdir}/etc/${_pkgname}.json"
  ln -sf "/etc/${_pkgname}.json" "${pkgdir}/var/lib/${_pkgname}/config.json"

  install -Dm644 "${srcdir}"/groovebasin.service \
    "${pkgdir}"/usr/lib/systemd/system/groovebasin.service
}

# vim:set ts=2 sw=2 et:
