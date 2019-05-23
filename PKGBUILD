# Maintainer: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=19.2.10
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
sha512sums=('920390f82c602e583f26deb899c9866f3807babb2cd2263e467f233065e8efe4bfa68c582f1ce814c265197b6cd18cf8b23fc7624b28b501587d6fb1da7868c9'
            '52ccb4c1b78ca4b739d3c100bef05d76a718d07a0d81645248e1775c755170f8b3aef07034ab0890c3a77ce370c4fc8730ac1abb14cb7ff7823bef3897b13141'
            '7eebe31724a9e6a36bec709353a90d4e41e915291750cff8a255a2fec10a9ab67c1daba83eed70b9d29f1b58d4cb6c68d68f483da99db047ac73ae1d97869277'
            '67c228fb4a25d1ce529d1689e81703284015ab2721cecdac8264a94e1a41e629e6b6cb82566d41744ebce0d84b7e5c54156cc62c447f7b10b41e012682d0e146')

prepare() {
  cd $srcdir/$pkgname-release-v$pkgver
  sed -i 's/^check-dependencies$/#check-dependencies/g' start-mycroft.sh
  sed -i 's/change_ownership$/:/g' scripts/prepare-msm.sh
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
