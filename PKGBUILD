# Maintainer: robertfoster
# Contributor: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=21.2.2
pkgrel=1
pkgdesc="The Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('python'
  'python-gobject'
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
makedepends=('git' 'sudo' 'python-pip' 'python-setuptools' 'python-virtualenv' 'sudo')
install=mycroft-core.install
source=("${url}/archive/release/v${pkgver}.tar.gz"
  "mycroft.tmpfiles"
  "mycroft.sysusers"
  "mycroft.service"
  "client.conf"
  "mycroft.sh"
  "mycroft.csh"
)

prepare() {
  cd "$srcdir/$pkgname-release-v$pkgver"
  sed -i 's/^check-dependencies$/#check-dependencies/g' start-mycroft.sh
  sed -i 's/change_ownership$/:/g' scripts/prepare-msm.sh
}

package() {
  mkdir -p "${pkgdir}/usr/share/"
  cp -R "mycroft-core-release-v${pkgver}" "${pkgdir}/usr/share/mycroft-core"

  # Place a link to mimic where mycroft is expecting it
  mkdir -p "${pkgdir}/usr/share/mycroft-core/mimic/bin"
  ln -s /usr/bin/mimic "${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic"

  # Set permissions
  chmod -R 755 "${pkgdir}/usr/share/mycroft-core"

  # systemd
  install -D -m644 "${srcdir}/mycroft.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 "${srcdir}/mycroft.sysusers" "${pkgdir}/usr/lib/sysusers.d/mycroft.conf"
  install -D -m644 "${srcdir}/mycroft.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/mycroft.conf"

  # Virtualenv
  cd "$pkgdir/usr/share/mycroft-core"
  virtualenv .venv
  source .venv/bin/activate
  pip install -r requirements/requirements.txt
  pip install -r requirements/extra-audiobackend.txt
  pip install -r requirements/extra-stt.txt

  # Fix Virtualenv
  sed -i 's/^VIRTUAL_ENV=.*/VIRTUAL_ENV="\/usr\/share\/mycroft-core\/.venv"/g' .venv/bin/activate
  pathtoreplace=$(echo $pkgdir | sed 's:/:\\\/:g')
  rm .venv/bin/activate.{fish,csh}

  # Cleanup
  find . -name "*.py[co]" -o -name __pycache__ -exec rm -rf {} +
  rm -rf "$pkgdir/usr/share/mycroft-core/test"
  sed -i "s/$pathtoreplace//g" "$pkgdir"/usr/share/mycroft-core/.venv/bin/*

  # Use a sane default editor
  sed -i "s/sensible-editor/vi/g" "$pkgdir"/usr/share/mycroft-core/bin/mycroft-config
  # Pulseaudio Client configuration
  install -Dm644 "${srcdir}/client.conf" \
    "${pkgdir}/var/lib/mycroft/.config/pulse/client.conf"

  # Set environmental variable for binary usage
  install -Dm644 "${srcdir}/mycroft.sh" \
    "${pkgdir}/etc/profile.d/mycroft.sh"
  install -Dm644 "${srcdir}/mycroft.csh" \
    "${pkgdir}/etc/profile.d/mycroft.csh"
}

md5sums=('5d2c2752f21a172f0b8be7795f57815b'
         '39bcf2f0f30854b7b6e516d49946566a'
         'bfe08c1d8cba053ef83cfac5a36c7910'
         '7cbcc7b8b71d00c19a11166fbbd5ed4f'
         '2d14d871585ffafcf86a52da96ff4c4c'
         '9e760b5fe356a12e126de036120c7319'
         '6c78c4a328e1322b8155086a73a77486')
