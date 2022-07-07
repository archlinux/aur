# Maintainer: zhs <zhao4she4@tuta.io>
# by and large a copy of the stable version one by Harpo Roeder with a few
# small modifications

pkgname='ebpfsnitch-git'
_pkgname='ebpfsnitch'
pkgver=0.3.0.13.g1220a38
pkgrel=1
pkgdesc='eBPF based Application Firewall, source from its git repository'
arch=('x86_64')
license=('BSD3')

provides=('ebpfsnitch-git' 'ebpfsnitchd-git')

depends=(
    'cmake'
    'clang'
    'bpf'
    'libbpf'
    'libnetfilter_queue'
    'spdlog'
    'boost'
    'libmnl'
    'nlohmann-json'
    'python3'
    'python-pyqt5'
    'conntrack-tools'
    'xxd-standalone'
)

makedepends=('git' 'python-setuptools')

source=("git+https://github.com/harporoeder/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
    cd "$srcdir/${_pkgname}"
    # required to compile with newer versions of libbpf
    # consult https://lore.kernel.org/bpf/20210616083635.11434-1-lmb@cloudflare.com/T/
    # and /usr/include/bpf/bpf_tracing.h
    sed -i 's/#define bpf_target_x86/#define __TARGET_ARCH_x86/' probes.c
    mkdir build && cd build
    cmake -D CMAKE_INSTALL_PREFIX="/usr/bin" ..
    # the following two lines are the CFLAGS in the cmake cache, minus cf-protection=return
    cmake -D CMAKE_C_FLAGS:STRING="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
				   -Wp,-D_FORTIFY_SOURCE=2,-D_GLIBCXX_ASSERTIONS -Wformat -Werror=format-security -fstack-clash-protection" ..
    cmake -D CMAKE_CXX_FLAGS:STRING="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions \
    				   -Wp,-D_FORTIFY_SOURCE=2,-D_GLIBCXX_ASSERTIONS -Wformat -Werror=format-security -fstack-clash-protection" ..

    make
}

package() {
    cd "$srcdir/${_pkgname}/build"
    make DESTDIR="$pkgdir/" install
    cd "$srcdir/${_pkgname}/ui"
    python setup.py install --root="$pkgdir/"
    cd "$srcdir/${_pkgname}"
    install -Dm644 ebpfsnitchd.service -t "$pkgdir/usr/lib/systemd/system"
}
