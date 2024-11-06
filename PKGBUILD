# Maintainer: envolution
# Contributor: EndlessEden
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Gregor Ibic <gregor.ibic@intelicom.si>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=clamav-git
_pkgname=clamav
pkgver=1.4.1+r11250+52b201762
pkgrel=1
pkgdesc='Anti-virus toolkit for Unix - Git latest'
url='https://www.clamav.net/'
license=(GPL-2.0-only)
arch=(x86_64)
depends=(
  bash
  bzip2
  curl
  gcc-libs
  glibc
  json-c
  libltdl
  libmspack
  libxml2
  ncurses
  openssl
  pcre2
  systemd-libs
  zlib
)
makedepends=(
  git
  cargo
  cmake
  libmilter
  ninja
  python
  python-pytest
  systemd
)
checkdepends=(
  check
)
backup=(
  etc/clamav/clamd.conf
  etc/clamav/freshclam.conf
  etc/clamav/clamav-milter.conf
  etc/logrotate.d/clamav
)

provides=(
  libclamav.so
  libclamunrar.so
  libclamunrar_iface.so
)

conflicts=(
  libclamav.so
  libclamunrar.so
  libclamunrar_iface.so
)

source=(
  git+https://github.com/Cisco-Talos/clamav.git
  clamav.logrotate
  clamav.tmpfiles
  clamav.sysusers
)
sha512sums=('SKIP'
            '9cb168c1c16bb43c99900d7ef34456e3f3b593d4d1943c875a0306bc86fd3872cb78e9e1413dcba93579e01b96d466c9eea1975e24190193663b7986c4525d48'
            'c5443634399bd87fe0d0192518538ffdb7296a8437b5b0160a0fbd58696b01285de3237e3feb552c0095c49e576832dec2e2b2107eef2be42424ed7edd13cd19'
            'b984836f6c34d97b90d81fa5d17361a2e3f8c0cc709e3350a4d25cf088dc04f7bf2504359980c8be489c96b1b8798c60e6da533069d3378d49d4f50f929a2c90')
validpgpkeys=(
  C71C5DF5E1E7D51CCB8B9D5CCCE0DFD21EC1A9BF # Talos (Talos, Cisco Systems Inc.) <research@sourcefire.com>
)

prepare() {
  cd ${_pkgname}
  ls -latr
  sed -E 's|^(Example)$|#\1|' -i etc/{clamd,freshclam,clamav-milter}.conf.sample
  sed -E 's|#(User) .+|\1 clamav|' -i etc/{clamd,freshclam,clamav-milter}.conf.sample
  sed -E 's|#(LogFile) .+|\1 /var/log/clamav/clamd.log|' -i etc/clamd.conf.sample
  sed -E 's|#(LogTime) .+|\1 yes|' -i etc/clamd.conf.sample etc/clamav-milter.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/clamd.pid|' -i etc/clamd.conf.sample
  sed -E 's|#(TemporaryDirectory) .+|\1 /tmp|' -i etc/{clamd,clamav-milter}.conf.sample
  sed -E 's|#(LocalSocket) .+|\1 /run/clamav/clamd.ctl|' -i etc/clamd.conf.sample
  sed -E 's|#(UpdateLogFile) .+|\1 /var/log/clamav/freshclam.log|' -i etc/freshclam.conf.sample
  sed -E 's|#(DatabaseMirror) .+|\1 database.clamav.net|' -i etc/freshclam.conf.sample
  sed -E 's|#(NotifyClamd) .+|\1 /etc/clamav/clamd.conf|' -i etc/freshclam.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/freshclam.pid|' -i etc/freshclam.conf.sample
  sed -E 's|#(LogFile) .+|\1 /var/log/clamav/clamav-milter.log|' -i etc/clamav-milter.conf.sample
  sed -E 's|#(PidFile) .+|\1 /run/clamav/clamav-milter.pid|' -i etc/clamav-milter.conf.sample
  sed -E "s|(\\[Unit\\])|\\1\\nWants=network-online.target\\nAfter=network-online.target|" -i freshclam/clamav-freshclam.service.in
}

build() {
  cd ${_pkgname}
  cmake \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SBINDIR=bin \
    -DAPP_CONFIG_DIRECTORY=/etc/clamav \
    -DDATABASE_DIRECTORY=/var/lib/clamav \
    -DENABLE_EXTERNAL_MSPACK=ON \
    -Wno-dev \
    -B build \
    -G Ninja \
    -S .
  ninja -C build
}

check() {
  cd ${_pkgname}
  if ! ninja -C build test; then
    echo "test failure, rerun in verbose mode"
    cat build/Testing/Temporary/LastTest.log
    ctest --test-dir build --rerun-failed --output-on-failure --extra-verbose
    exit 1
  fi
}

pkgver() {
  cd ${_pkgname}

  _version=$(git tag --sort=-v:refname --list 'clamav-*.*' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'clamav-'}+r${_commits}+${_short_commit_hash}"
}

package() {
  depends+=(
    libsystemd.so
    libncursesw.so
    libcurl.so
    libjson-c.so
    libbz2.so
  )

  cd ${_pkgname}
  DESTDIR="${pkgdir}" ninja -C build install

  mv "${pkgdir}"/etc/clamav/freshclam.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamd.conf{.sample,}
  mv "${pkgdir}"/etc/clamav/clamav-milter.conf{.sample,}

  install -Dm 644 ../clamav.sysusers "${pkgdir}"/usr/lib/sysusers.d/clamav.conf
  install -Dm 644 ../clamav.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/clamav.conf
  install -Dm 644 ../clamav.logrotate "${pkgdir}"/etc/logrotate.d/clamav
}

# vim: ts=2 sw=2 et:
