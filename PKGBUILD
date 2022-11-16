# Maintainer: nullableVoidPtr <them+arch _ nullablevo _ id _ au>
# Contributor: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn-git
pkgname=('unicorn-git' 'python-unicorn-git' 'ruby-unicorn-engine-git')
pkgver=2.0.1.r4.ge9c1c17f
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'cmake' 'python' 'python-setuptools' 'ruby')
checkdepends=('cmocka')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
options=('!emptydirs' 'debug')
source=(${pkgbase}::git+https://github.com/unicorn-engine/unicorn#branch=dev)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgbase}
  export UNICORN_CFLAGS="${CFLAGS} -ffat-lto-objects"
  export UNICORN_QEMU_FLAGS="--extra-ldflags=\"$LDFLAGS\""
  export QEMU_CXXFLAGS="${CXXFLAGS}"
  export QEMU_LDFLAGS="${LDFLAGS}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
  (cd bindings
    python const_generator.py python
    python const_generator.py ruby
  )
  (cd bindings/python
    env LIBUNICORN_PATH="set to not rebuild so" python setup.py build
  )
  (cd bindings/ruby/unicorn_gem
    gem build unicorn-engine.gemspec
  )
}

check() {
  cd ${pkgbase}
  ctest --test-dir build --output-on-failure
}

package_unicorn-git() {
  depends=('glibc')
  provides=('unicorn' 'libunicorn.so=2')
  cd ${pkgbase}
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-unicorn-git() {
  depends=('python' 'unicorn' 'python-setuptools')
  provides=(python-unicorn=$pkgver)
  conflicts=(python-unicorn)
  cd ${pkgbase}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_ruby-unicorn-engine-git() {
  depends=('ruby' 'unicorn')
  replaces=('ruby-unicorn' 'ruby-unicorn-git')
  provides=(ruby-unicorn-engine=$pkgver)
  conflicts=(ruby-unicorn-engine)
  cd ${pkgbase}/bindings/ruby/unicorn_gem
  local _gemdir="$(ruby -e 'puts Gem.default_dir')"
  gem install \
    --verbose \
    --ignore-dependencies \
    --no-user-install \
    -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" \
    unicorn-*.gem -- \
    --with-opt-include="${srcdir}/${pkgbase}/include" \
    --with-opt-lib="${srcdir}/${pkgbase}-${pkgver}/build"

  rm -r "${pkgdir}/${_gemdir}"/{cache/unicorn-*.gem,build_info}
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
  install -Dm 644 ../sample* -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

# vim: ts=2 sw=2 et:
