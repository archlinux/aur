# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=outline
pkgver=0.44.0
pkgrel=1
pkgdesc="Wiki and knowledge base for growing teams"
arch=('x86_64')
url="https://www.getoutline.com"
license=('BSL')
makedepends=('npm' 'nodejs')
optdepends=('redis' 'postgresql')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/outline/outline/archive/v${pkgver}.tar.gz"
	"outline.service"
	"outline.sysusers")
sha512sums=('ec05e98d6da0d78245422a7cf8c22a2bfbc5b160ae67de81beaca16992386ef18e82ff651c15b6f5ab4c917de5ed13bbfc0c3131f469222fb398df4252114cd7'
            'b900561a41dd9fb001a226388fd4af766687e547777ca977c4b4e2a59605e534686f22b7eb98ddafae4483d8a3b255e91c22546165cf9f2f4c4273726218e409'
            'a9849e480b280e04d58e949a1b0f4daa548cd8e2ee3e567524ebe5b04815211294a16aadffa6c7f02e1be87dd13120fad6a551abd040d827a84b42945965efb3')
backup=('usr/share/webapps/outline/.env')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  npm i
  npm run build:webpack
}

package() {
  install -d "${pkgdir}/usr/share/webapps/outline"
  install -d "${pkgdir}/etc/webapps/outline"

  cp -r "${srcdir}/${pkgname}-${pkgver}/." "${pkgdir}/usr/share/webapps/outline/"

  cp "${pkgdir}/usr/share/webapps/outline/.env.sample" "${pkgdir}/usr/share/webapps/outline/.env"
  ln -s "/usr/share/webapps/outline/.env" "${pkgdir}/etc/webapps/outline/.env"

  install -Dm 644 "${srcdir}/outline.service" "${pkgdir}/usr/lib/systemd/system/outline.service"
  install -Dm 644 "${srcdir}/outline.sysusers" "${pkgdir}/usr/lib/sysusers.d/outline.conf"
}
