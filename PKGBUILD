# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgbase=unicorn-git
pkgname=('unicorn-git' 'python-unicorn-git' 'python2-unicorn-git' 'ruby-unicorn-git')
pkgver=1.0.2.rc1.r5.g3b17db0d
pkgrel=1
pkgdesc='Lightweight, multi-platform, multi-architecture CPU emulator framework based on QEMU'
url='http://www.unicorn-engine.org'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('git' 'python' 'python2' 'python-setuptools' 'python2-setuptools' 'ruby')
options=('staticlibs' '!emptydirs')
source=(${pkgbase}::git+https://github.com/unicorn-engine/unicorn)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgbase}
  sed 's|-O3|-O2|g' -i Makefile qemu/configure
  sed 's|-g ||g' -i qemu/configure
  sed 's|UNICORN_DEBUG ?= yes|UNICORN_DEBUG ?= no|g' -i config.mk
  cp -ra bindings/python{,2}
  sed -r 's|(python)$|\12|' -i bindings/python2/*.py
}

build() {
  cd ${pkgbase}
  make UNICORN_QEMU_FLAGS="--python=/usr/bin/python2"
  (cd bindings
    python const_generator.py python
    python const_generator.py ruby
  )
  (cd bindings/python
    python setup.py build
  )
  (cd bindings/python2
    python2 setup.py build
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
  make DESTDIR="${pkgdir}" install
  install -Dm 644 samples/*.c -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python-unicorn-git() {
  depends=('python' 'unicorn')
  provides=('python-unicorn')
  conflicts=('python-unicorn')
  cd ${pkgbase}/bindings/python
  python setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_python2-unicorn-git() {
  depends=('python2' 'unicorn')
  provides=('python2-unicorn')
  conflicts=('python2-unicorn')
  cd ${pkgbase}/bindings/python2
  python2 setup.py install --root="${pkgdir}" -O1 --skip-build
  install -Dm 644 sample* shellcode.py -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

package_ruby-unicorn-git() {
  depends=('ruby' 'unicorn')
  provides=('ruby-unicorn')
  conflicts=('ruby-unicorn')
  cd ${pkgbase}/bindings/ruby/unicorn_gem
  local _gemdir="$(gem env gemdir)"
  gem install --ignore-dependencies --no-user-install -i "${pkgdir}${_gemdir}" \
    -n "${pkgdir}/usr/bin" unicorn-*.gem -- --with-opt-include="${srcdir}/${pkgbase}/include"
  rm -r "${pkgdir}/${_gemdir}"/{cache/unicorn-*.gem,build_info}
  find "${pkgdir}/${_gemdir}" \( -name 'mkmf.log' -or -name 'gem_make.out' \) -delete
  install -Dm 644 ../sample* -t "${pkgdir}/usr/share/doc/${pkgname}/samples"
}

# vim: ts=2 sw=2 et:
