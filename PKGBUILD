# Maintainer: Jannick Hemelhof <mister {dot} jannick {at} gmail {dot} com>
# Contributor: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Dick Choi <fluke8259 {at} gmail {dot} com>
# Contributor: Romain Bazile <gromain {dot} baz {at} gmail {dot} com>
pkgname=boostnote
_pkgname=Boostnote
pkgver=0.8.7
pkgrel=2
pkgdesc="Open source note-taking app for programmers"
arch=('any')
url="https://boostnote.io/"
license=('GPL3')
depends=('electron')
makedepends=('npm' 'grunt-cli')

source=(
  "${pkgver}.tar.gz::https://github.com/BoostIO/"${_pkgname}"/archive/v"$pkgver".tar.gz"
  "${pkgname}.js"
  "${pkgname}.desktop"
  "npm-prune-fix.patch"
  )

sha512sums=(
  '400bcd5f2a2fa3c858c4e5ab8ce22c8f9669a5c1c0299724937f56534248e0517c8a814b7c2f2243c8492edbb50e96b2a2a2ce787f6566cbfec1741521d5261c'
  'f0abbdcca34d7f74d3dc66ffc2d0995416e7708c715d55fa58c4c2abc31d191ea42f3434e3105292b4817f83ac0ca89f456f5f93007ae80ab2426c8941f615f9'
  '18bcda13580da8ceeaa86793a77ec00a053b8fd51451dad7e2b1a19553fe1a467ac647b44b789212e783f3f6a80968cc9404e884ef7ff6b1f6588473b3229d40'
  'c500237c18fc1fcd98f3fd6d1b0bd74764e6f53a87c258b4d68b6d4754ad2281317b89e411aaf5af4d2c9f837f67218cd3663e27fc77da5137b217724f91039c'
  )

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 -i "${srcdir}/npm-prune-fix.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  npm install
  grunt compile
  npm prune --production
  cp resources/app.png ../app.png
}

package() {
  cd "${_pkgname}-${pkgver}"

  appdir="/usr/lib/${pkgname}"

  install -dm755 "${pkgdir}""${appdir}"
  cp -r * "${pkgdir}""${appdir}"

  install -Dm755 "${srcdir}/${pkgname}.js" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/app.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"

  find "${pkgdir}""${appdir}" \
        -name "package.json" \
            -exec sed -e "s|${srcdir}/${pkgname}-${pkgver}|${appdir}|" \
                -i {} \; \
        -or -name ".*" -prune -exec rm -r '{}' \; \
        -or -name "Gruntfile.js" -exec rm '{}' \; \
        -or -name "Makefile" -exec rm '{}' \; \
        -or -name "bower.json" -exec rm '{}' \; \
        -or -name "cmd.js" -exec rm '{}' \; \
        -or -name "coffee" -prune -exec rm -r '{}' \; \
        -or -name "example" -prune -exec rm -r '{}' \; \
        -or -name "gulpfile.js" -exec rm '{}' \; \
        -or -name "test" -prune -exec rm -r '{}' \; \
        -or -name "tests" -prune -exec rm -r '{}' \;
}

