# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>
# Contributor: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn-git
pkgname=('unicorn-git' 'python-unicorn-git' 'ruby-unicorn-git')
pkgver=2.0.0.r0.g6c1cbef6
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'cmake' 'python' 'python-setuptools' 'ruby')
options=('staticlibs' '!emptydirs')
source=(${pkgbase}::git+https://github.com/unicorn-engine/unicorn)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgbase}
  (mkdir -p build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
  )
  (cd bindings
    python const_generator.py python
    python const_generator.py ruby
  )
  (cd bindings/python
    python setup.py build
  )
  (cd bindings/ruby/unicorn_gem
    gem build unicorn-engine.gemspec
  )
}

check() {
  cd ${pkgbase}
  # Tests are not supported right now, hope they get some love soon
  # checkdepends=('cmocka')
  # make test
}

package_unicorn-git() {
  depends=('glibc')
  provides=('unicorn')
  conflicts=('unicorn')
  cd ${pkgbase}
  (mkdir -p build
    cd build
    make DESTDIR="${pkgdir}" install
  )
  install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-unicorn-git() {
  depends=('python' 'unicorn' 'python-setuptools')
  provides=('python-unicorn')
  conflicts=('python-unicorn')
  cd ${pkgbase}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_ruby-unicorn-git() {
  depends=('ruby' 'unicorn')
  provides=('ruby-unicorn')
  conflicts=('ruby-unicorn')
  cd ${pkgbase}/bindings/ruby/unicorn_gem
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" unicorn-*.gem -- --with-opt-include="${srcdir}/${pkgbase}/include"
  rm -r "${pkgdir}/${_gemdir}"/{cache/unicorn-*.gem,build_info}
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
  install -Dm 644 ../sample* -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

# vim: ts=2 sw=2 et:
