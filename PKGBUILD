# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=PiFmRds
pkgname=pi-fm-rds-git
_name=${pkgname%-git}
pkgver=65.e4e246e
pkgrel=1
arch=('armv6h' 'armv7h' 'aarch64')
pkgdesc="FM-RDS transmitter using the Raspberry Pi's PWM"
license=('GPL-3.0')
depends=('libsndfile')
optdepends=('python-scipy: generate_pulses and generate_waveforms'
            'python-numpy: generate_pulses and generate_waveforms'
            'python-matplotlib: generate_waveforms'
            'python-pydemod: generate_waveforms')
makedepends=('git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/ChristopheJacquet/${_reponame}"
source=("${_reponame}::git://github.com/ChristopheJacquet/${_reponame}.git"
        '0001-Add-compile-flags-for-aarch64.patch'
        '0002-Prevent-undefined-reference-to-makedev.patch')
sha256sums=('SKIP'
            '4d5727b0657de420d12908203e8b44fdea1c1adfc3bde451266da29008440c3b'
            'b21eea03a5bf79398f46fce0b4d4f5c67af0938446458fe324b1726f6e28db90')

prepare() {
  cd "$srcdir/$_reponame"

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}

pkgver() {
  cd "$srcdir/$_reponame"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_reponame/src"
  make
  make rds_wav
}

package() {
  cd "$srcdir/$_reponame/src"
  install -Dm0755 "pi_fm_rds" "$pkgdir/usr/bin/pi_fm_rds"
  install -Dm0755 "rds_wav" "$pkgdir/usr/bin/rds_wav"
  install -Dm0755 "generate_pulses.py" "$pkgdir/usr/bin/generate_pulses"
  install -Dm0755 "generate_waveforms.py" "$pkgdir/usr/bin/generate_waveforms"
}
