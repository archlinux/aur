# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-gendercomputer-git
pkgver=r32.4868688
pkgrel=1
pkgdesc='Python 3 library that tries to guess a persons gender based on their name and location.'
arch=('any')
url='https://github.com/tue-mdse/genderComputer'
license=('custom')
depends=('python')
source=('git+https://github.com/tue-mdse/genderComputer.git')
sha256sums=('SKIP')
makedepends=('git' 'python-setuptools')
provides=('python-gendercomputer')
conflicts=('python-gendercomputer')

pkgver() {
  cd genderComputer
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

package() {
  cd genderComputer

  # We don't need anything related to git in the package
  rm -rf .git*

  # No license so install the readme as the license 
  install -D -m644 readme.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  msg "Since no setup.py lets set it up by hand"
  pydir=`python -c "from distutils.sysconfig import get_python_lib; \
    print(get_python_lib())"`
  mkdir -p "${pkgdir}/${pydir}"
  mkdir -p "${pkgdir}/${pydir}/"gendercomputer
  touch "${pkgdir}/${pydir}/gendercomputer/__init__.py"
  cp *.py "${pkgdir}/${pydir}/"gendercomputer
}

# vim:set ts=2 sw=2 et:
