pkgname=falco-git
_pkgname=falco
pkgver=0.43.0.r42.g8a4c9e23
pkgrel=1
pkgdesc="Cloud native runtime security"
arch=('x86_64')
url="https://falco.org/"
license=('Apache-2.0')
depends=('yaml-cpp' 'cxxopts' 'cpp-httplib' 'protobuf' 'libelf' 'libbpf' 'bpf' 'nlohmann-json')
makedepends=('git' 'cmake' 'clang' 'llvm' 'linux-headers' 'jq')
provides=('falco')
conflicts=('falco' 'falco-bin')
backup=('etc/falco/falco_rules.yaml' 'etc/falco/falco.yaml')
source=('git+https://github.com/falcosecurity/falco.git'
        'git+https://github.com/falcosecurity/rules.git'
        'falco-modern-bpf.service')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  mkdir -p build skeleton
}

build() {
  cd "$srcdir/$_pkgname/skeleton"
  cmake .. -DUSE_BUNDLED_DEPS=OFF \
           -DBUILD_FALCO_MODERN_BPF=ON \
           -DCREATE_TEST_TARGETS=OFF \
           -DFALCO_VERSION=$(cd .. && git describe --tags)
  make ProbeSkeleton

  cd "$srcdir/$_pkgname/build"
  cmake .. \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DUSE_BUNDLED_DEPS=OFF \
      -DBUILD_FALCO_MODERN_BPF=ON \
      -DMODERN_BPF_SKEL_DIR="$srcdir/$_pkgname/skeleton/skel_dir" \
      -DBUILD_DRIVER=OFF \
      -DBUILD_BPF=OFF \
      -DFALCO_VERSION=$(cd .. && git describe --tags)
  make falco -j$(nproc)
}

package() {
  cd "$srcdir/$_pkgname/build"
  install -Dm755 "userspace/falco/falco" "$pkgdir/usr/bin/falco"

  cd "$srcdir/$_pkgname"
  install -Dm644 "falco.yaml" "$pkgdir/etc/falco/falco.yaml"

  cd "$srcdir/rules"
  install -Dm644 "rules/falco_rules.yaml" "$pkgdir/etc/falco/falco_rules.yaml"
  install -d "$pkgdir/etc/falco/rules.d"

  cd "$srcdir"
  install -Dm644 "falco-modern-bpf.service" "$pkgdir/usr/lib/systemd/system/falco-modern-bpf.service"
}
