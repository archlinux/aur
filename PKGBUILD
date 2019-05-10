# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=19.2.7
pkgrel=1
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
        "mycroft.service")
sha512sums=('2c43ee3f065a8fee06420a601034aeb6732d3dd3af5899d8bea5fdda7d559fed8fad294ac3bec208a3474469f795634d4436b2528c93d8728816328313ed8ed4'
            '415cc1b32933303a4e730b365b70f3310fd3bb691675f6fe31247e2e64c2e4e58d3919659f021f4195ee51424c882f7d52812c89b8a62c57b23e477586cbb04d'
            '7eebe31724a9e6a36bec709353a90d4e41e915291750cff8a255a2fec10a9ab67c1daba83eed70b9d29f1b58d4cb6c68d68f483da99db047ac73ae1d97869277'
            '67c228fb4a25d1ce529d1689e81703284015ab2721cecdac8264a94e1a41e629e6b6cb82566d41744ebce0d84b7e5c54156cc62c447f7b10b41e012682d0e146')

prepare() {
  cd $srcdir/$pkgname-release-v$pkgver
  sed -i 's/^check-dependencies$/#check-dependencies/g' start-mycroft.sh
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
