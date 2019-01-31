# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='msoffice-crypt-git'
pkgver=0.0.r49.ge825799
pkgrel=1
pkgdesc='A tool and lib to encrypt decrypt crack Microsoft Office 2010+ xml Documents Word docx Excel xlsx PowerPoint pptx'
arch=('x86_64' 'i686')
url='https://github.com/herumi/msoffice'
license=('BSD')
depends=('openssl')
makedepends=('git')
checkdepends=('python2')
provides=("${pkgname%-git}=${pkgver%%.r*}")
conflicts=("${pkgname%-git}")
options=('!strip')
#_verwatch=("${url}/releases" ".*/msoffice-\([0-9.]\+\)\.tar\.gz.*" 'f') # No releases yet
_srcdir="msoffice"
source=("git+${url}.git" "git+${url%/*}/cybozulib.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf '0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  find .. -type 'f' '(' -name '*.exe' -o -name '*.dll' -o -name '*.vbs' -o -name '*.props' -o -name '*.bat' -o -name '*.def' -o -name '*.sln' ')' -delete
  rm -r 'src/proj' 'test/proj'
  rm -r 'bin/64'
  sed -e 's:\r$::g' -i $(grep -Ilr $'\r' *)
  # Test runs in python2
  sed -e 's:\bpython\b:&2:g' -i 'Makefile'
  # Strip in compile isn't getting rid of source references
  sed -e 's:^LDFLAGS = .*$:& -s:g' -i 'common.mk'
  # Change extension so we can delete all .exe files
  sed -e 's:\.exe:.lx:g' -i 'common.mk' 'test_all.py'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make RELEASE=1
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  # No samples provided in data/
  if [ -d 'data' ]; then
    make -j1 test
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dp 'bin/msoffice-crypt.lx' "${pkgdir}/usr/bin/msoffice-crypt"
  install -Dp 'bin/attack.lx' "${pkgdir}/usr/bin/attack"
  install -Dp lib/*.so -t "${pkgdir}/usr/lib/"

  install -Dp 'COPYRIGHT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  set +u
}
set +u
