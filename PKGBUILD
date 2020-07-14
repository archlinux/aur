# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=outline
pkgver=0.44.0
pkgrel=2
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
            '24c91cb7e88b75fc785f6c49c5a80460085ff329e7b7ce4be60059205d6e2aef07d61aad91d038ecfb8265eace4d21f1e6a6abf678bafcf13244f285b35c56d6'
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
