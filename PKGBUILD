# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=18.8.4
pkgrel=2
pkgdesc="The Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('git'
         'python'
         'python-pip'
         'python-setuptools'
         'python-virtualenv'
         'python-gobject'
         'python-virtualenvwrapper'
         'libffi'
         'swig'
         'portaudio'
         'mimic'
         'mpg123'
         'screen'
         'flac'
         'curl'
         'icu'
         'libjpeg-turbo'
         'jq'
         'pulseaudio'
         'pulseaudio-alsa'
         'fann')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
source=("https://github.com/MycroftAI/mycroft-core/archive/release/v${pkgver}.tar.gz"
        "mycroft-core.install"
        "venv_init"
        "mycroft.service"
        "notify.patch")
sha512sums=('8e1168779cfaf74f7e01f2d5de189e3ec528b2e2380c656724162e006caebfbcc61482421751f81c417d9423615d33413370daa58901e337cb4dedfe1ac9cb73'
            '415cc1b32933303a4e730b365b70f3310fd3bb691675f6fe31247e2e64c2e4e58d3919659f021f4195ee51424c882f7d52812c89b8a62c57b23e477586cbb04d'
            '2ec4d296d45c0f3c63c6253a110638b4a87835865b974460d4a592e562f2325c83d3eb18b1a0272622e088469383a0349d65779a5081b1da3d624c6e3d3be8f0'
            '67c228fb4a25d1ce529d1689e81703284015ab2721cecdac8264a94e1a41e629e6b6cb82566d41744ebce0d84b7e5c54156cc62c447f7b10b41e012682d0e146'
            '4d0793e1d9c569e586ed951b7e60f16da3fe008f39b298a4747168e294cea2d5dff3b13c188368b336e8642b4b1a08e1a275816c8e5fb386566c729e9761d372')

prepare() {
  cd $srcdir/$pkgname-release-v$pkgver
  patch -N -i "${srcdir}/notify.patch"
}

package() {
  mkdir -p ${pkgdir}/usr/share/
  cp -R mycroft-core-release-v${pkgver} ${pkgdir}/usr/share/mycroft-core
  cp venv_init ${pkgdir}/usr/share/mycroft-core

  # Place a link to mimic where mycroft is expecting it
  mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
  ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

  # Set permissions
  chmod -R g+w ${pkgdir}/usr/share/mycroft-core

  # Symtemd unit
  install -D -m644 "${srcdir}/mycroft.service" "${pkgdir}/usr/lib/systemd/user/mycroft.service"
}
