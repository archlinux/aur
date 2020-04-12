pkgname=jtc-git
pkgver=1.75d+r45.20200311.g7261ace
pkgrel=1
pkgdesc="Select JSON elements from input and apply various (e.g. sort, transform, etc) action then output, think it as an alternative to jq"
url=https://github.com/ldn-softdev/jtc
license=(MIT)
source=(git+$url)
b2sums=(SKIP)
arch=(x86_64 i686 aarch64)
makedepends=(git)

pkgver() {
  cd jtc
  local _long=$(git describe --long --tags | sed 's|^\([^-]\+\)-\([0-9]\+\)-\(g[0-9a-f]\+\)|\1+r\2.\3|')
  local _date=$(git log -n1 --format=%cs)
  echo ${_long%.*}.${_date//-/}.${_long##*.}
}

build() {
  cd jtc
  if [[ $CXX == "g++" || ! -v $CXX ]]; then
    g++ $CXXFLAGS $LDFLAGS -std=gnu++14 -o jtc jtc.cpp
  elif [[ $CXX == "clang++" ]]; then
    $CXX $CXXFLAGS $LDFLAGS -std=c++14 -o jtc jtc.cpp
  else
    $CXX $CXXFLAGS $LDFLAGS -o jtc jtc.cpp
  fi
}

package() {
  cd jtc
  install -dm755 "$pkgdir"/usr/{bin,share/{doc,licenses}/jtc}
  install -pm755 jtc "$pkgdir"/usr/bin
  install -pm644 {README,'Release Notes','User Guide','Walk-path tutorial'}.md "$pkgdir"/usr/share/doc/jtc
  install -pm644 LICENSE "$pkgdir"/usr/share/licenses/jtc
}
