# Maintainer: Michael Thies <mail@mhthies.de>

pkgname=justbuild
pkgver='1.1.1'
pkgrel=1
pkgdesc="A generic build system supporting multi-repository builds"
arch=('x86_64')
url="https://github.com/just-buildsystem/justbuild"
license=('Apache')
depends=('python')
makedepends=('clang' 'binutils' 'wget' 'pandoc')
conflicts=('just' 'just-git' 'just-js')
source=("justbuild-${pkgver}.tar.gz::https://github.com/just-buildsystem/justbuild/archive/v${pkgver}.tar.gz")
sha256sums=('75b7d92d233250fa9751542cf5020c10b20e178f898b3fe1294fc9013b4ad5fe')

build() {
    cd "${srcdir}/justbuild-${pkgver}"
    # Clean build directory from potential previous run
    # The bootstrap script expects the build directory to be clean; esp. src, dep_includes and deps must not be present
    [[ -d "${srcdir}/build/dep_includes" ]] && rm -rf "${srcdir}/build"
    mkdir -p "${srcdir}/build"

    env JUST_BUILD_CONF='{"COMPILER_FAMILY": "clang", "CC": "/usr/bin/clang", "CXX": "/usr/bin/clang++", "AR": "/usr/bin/ar"}' python3 ./bin/bootstrap.py . "${srcdir}/build"

    # convert man pages from orgmode to man
    find "${srcdir}/justbuild-${pkgver}/share/man" -name "*.md" -exec sh -c 'pandoc --standalone --to man -o "${0%.md}.man" "${0}"' {} \;
}

package() {
    install -m 755 -Dt "${pkgdir}/usr/bin" "${srcdir}/build/out/bin/just" 
    install -m 755 -DT "${srcdir}/justbuild-${pkgver}/bin/just-mr.py" "${pkgdir}/usr/bin/just-mr"
    install -m 755 -DT "${srcdir}/justbuild-${pkgver}/bin/just-import-git.py" "${pkgdir}/usr/bin/just-import-git"
	
    # bash completion
    mkdir -p "${pkgdir}"/usr/share/bash-completion/completions
    install -m 0644 "${srcdir}/justbuild-${pkgver}"/share/just_complete.bash "${pkgdir}"/usr/share/bash-completion/completions/just

    # man
    mkdir -p "${pkgdir}"/usr/share/man/{man1,man5}
    install -m 0644 -t "${pkgdir}"/usr/share/man/man1 "${srcdir}/justbuild-${pkgver}"/share/man/*.1.man
    install -m 0644 -t "${pkgdir}"/usr/share/man/man5 "${srcdir}/justbuild-${pkgver}"/share/man/*.5.man
    find "${pkgdir}"/usr/share/man -name "*.man" -exec sh -c 'mv "$1" "${1%.man}"' _ {} \;
}
