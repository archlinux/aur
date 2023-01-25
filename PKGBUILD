# Maintainer: robertfoster
# Contributor: Thorben Guenther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=mycroft-core
pkgver=21.2.2
pkgrel=2
pkgdesc="The Mycroft Artificial Intelligence platform."
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/MycroftAI/mycroft-core'
license=('Apache')
depends=('python'
  'python-gobject'
  'libffi'
  'swig'
  'portaudio'
  'mimic1'
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

sha256sums=('3748b2422691bbfdf3e31e8a61ebf0eb3dfd5dd0f6103f0c501005437d83c728'
            'cbc90e2a3308619dbfe1ccf417b7a41d15fac13c7ae8124b90b82a4f09aa8485'
            '658ab08f0db3a2000d762c6a0a0bfd3a79d8375cf5a70f373ed097aa40f51278'
            '48f7bf2f24061bfbc58318f03098059bc8f292b5ae0f4a2cf5f90915587f74ad'
            '87fb0adc4f3ab15e9d71c4d4bfb799d50f5d14b3962e8eb4fd1de1e7d86486cf'
            'ec42c92425e016e747da0e61406754db0cabdccd5c6325ab9e8f6374a128263a'
            'c2199a1f1fe50c0178fa722f0bf6f674d29e86f0edef90895e28aa9b329a8e34')
