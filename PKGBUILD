# Maintainer: Thorben Günther <admin@xenrox.net>
 
pkgname='vikunja'
pkgver='0.24.6'
pkgrel=4
pkgdesc='The Todo-app to organize your life - API & frontend'
arch=('x86_64')
url='https://vikunja.io/'
license=('AGPL3')
backup=('etc/vikunja/config.yml')
makedepends=('git' 'go' 'mage' 'pnpm')
source=(
  "$pkgname::git+https://github.com/go-vikunja/vikunja#tag=v$pkgver"
  'vikunja.service'
  'vikunja.sysusers'
  'vikunja.tmpfiles'
)
sha256sums=('686d8a13adcefbecd15890b633cb409eebbbbd937a8f5fefa499dc7e916acb3b'
            'c12fa547366d7b604584fbb611840861790fe3cfae0be3f0b0a98f87a89076e3'
            '0a666743be3deaa16a436681d18003b11a1660b5fe7868fa25af2de11c7624f7'
            'e2facf1add86ae6d5ee0ce8c3c006a16e5d50b7d57fbd6519c17e31b9d7d75a5')

build() {
  cd "${srcdir}/${pkgname}"
  pushd frontend/ > /dev/null
  pnpm install
  pnpm run build
  popd > /dev/null
  mage build

}

package(){
  install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/vikunja"
  install -Dm640 "${srcdir}/${pkgname}/config.yml.sample" "${pkgdir}/etc/vikunja/config.yml"
  install -Dm640 "${srcdir}/vikunja.service" "${pkgdir}/usr/lib/systemd/system/vikunja.service"
  install -Dm644 "${srcdir}/vikunja.sysusers" "${pkgdir}/usr/lib/sysusers.d/vikunja.conf"
  install -Dm644 "${srcdir}/vikunja.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/vikunja.conf"
}
