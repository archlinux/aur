# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-cli
pkgver=1.15.4
pkgrel=2
pkgdesc='DVD and Blu-ray to MKV converter and network streamer - CLI only'
arch=('i686' 'x86_64')
url='https://www.makemkv.com'
license=('LGPL' 'MPL' 'custom')
depends=('ffmpeg' 'java-runtime')
optdepends_x86_64=('lib32-glibc: dts support')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=("${url}/download/makemkv-bin-${pkgver}.tar.gz"
        "${url}/download/makemkv-oss-${pkgver}.tar.gz"
        makemkvcon.1
        mmdtsdec.1)
b2sums=('945d5efc61d4302690201a63caa959580476635729d78f8b9fcb0f252af9874b10b9f6a771c724eb76ffe00fa4217773890045b1657335d9910f753c8de5a5bd'
        '84e958b6004fa66a52186118be1ca696a181e300d21a2be583917181b3f1f87ee47b760e3cbcfc26b4fcdae4711fd18962c42763ce8ec6b176aaf865ab4e45b0'
        'a318361982271bee3db2fa6f3e2b51afd7fe35f3dcb821c24bc21f8189be74cf9093559dbf9689eedd458226b30ddf59333af10ef509dc850331639b9035be39'
        '2402c0338cf3a5e28c46af98a72c76e8e22d54e812f1d1f0dc156590657af15a6264a05a5fbcbf288fea09b5f4eb6fd1bb3e8672e9afc1615170b7bd83ba69b1')

build() {
  cd makemkv-oss-${pkgver}
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd makemkv-oss-${pkgver}
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}"/makemkv-bin-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 src/eula_en_linux.txt "${pkgdir}"/usr/share/licenses/${pkgname}/eula_en_linux.txt

  cd "${srcdir}"
  install -Dm644 -t "${pkgdir}"/usr/share/man/man1/ makemkvcon.1 mmdtsdec.1
}
