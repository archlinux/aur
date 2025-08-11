# Maintainer: Michael Thies <mail@mhthies.de>

pkgname=justbuild
pkgver='1.6.3'
pkgrel=1
pkgdesc="A generic build system supporting multi-repository builds"
arch=('x86_64')
url="https://github.com/just-buildsystem/justbuild"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'fmt' 'openssl' 'zlib' 're2' 'c-ares' 'grpc' 'abseil-cpp' 'curl' 'python' 'protobuf' 'libarchive' 'libgit2')
makedepends=('clang' 'binutils' 'wget' 'cli11' 'nlohmann-json' 'pandoc')
conflicts=('just' 'just-git' 'just-js')
source=("justbuild-${pkgver}.tar.gz::https://github.com/just-buildsystem/justbuild/archive/v${pkgver}.tar.gz")
sha256sums=('331f4cdf8a88d994789a548bb4d10e0a001dd06d8f13d7ca18b7e436e40e03a9')

build() {
    cd "${srcdir}/justbuild-${pkgver}"
    # Clean build directory from potential previous run
    # The bootstrap script expects the build directory to be clean; esp. src, dep_includes and deps must not be present
    [[ -d "${srcdir}/build/src" ]] && rm -rf "${srcdir}/build"
    mkdir -p "${srcdir}/build"

    # Bootstrap just
    env JUST_BUILD_CONF='{"COMPILER_FAMILY": "clang", "CC": "/usr/bin/clang", "CXX": "/usr/bin/clang++", "AR": "/usr/bin/ar", "FINAL_LDFLAGS": ["-Wl,-z,relro,-z,now"]}'\
            PKG_CONFIG_PATH="${srcdir}"\
            PACKAGE=YES\
            LOCALBASE=/usr\
            NON_LOCAL_DEPS='["bazel_remote_apis", "google_apis", "com_github_microsoft_gsl"]'\
        python3 ./bin/bootstrap.py . ${srcdir}/build

    # Build compiled just-mr
    ../build/out/bin/just install 'installed just-mr' -c ../build/build-conf.json -C ../build/repo-conf.json --output-dir ../build/out

    # convert man pages from Markdown to man
    find "${srcdir}/justbuild-${pkgver}/share/man" -name "*.md" -exec sh -c 'pandoc --standalone --to man -o "${0%.md}.man" "${0}"' {} \;
}

package() {
    install -m 755 -Dt "${pkgdir}/usr/bin" "${srcdir}/build/out/bin/just" 
    install -m 755 -Dt "${pkgdir}/usr/bin" "${srcdir}/build/out/bin/just-mr"
    install -m 755 -DT "${srcdir}/justbuild-${pkgver}/bin/just-import-git.py" "${pkgdir}/usr/bin/just-import-git"
    install -m 755 -DT "${srcdir}/justbuild-${pkgver}/bin/just-deduplicate-repos.py" "${pkgdir}/usr/bin/just-deduplicate-repos"
	
    # bash completion
    mkdir -p "${pkgdir}"/usr/share/bash-completion/completions
    install -m 0644 "${srcdir}/justbuild-${pkgver}"/share/just_complete.bash "${pkgdir}"/usr/share/bash-completion/completions/just

    # man
    mkdir -p "${pkgdir}"/usr/share/man/{man1,man5}
    install -m 0644 -t "${pkgdir}"/usr/share/man/man1 "${srcdir}/justbuild-${pkgver}"/share/man/*.1.man
    install -m 0644 -t "${pkgdir}"/usr/share/man/man5 "${srcdir}/justbuild-${pkgver}"/share/man/*.5.man
    find "${pkgdir}"/usr/share/man -name "*.man" -exec sh -c 'mv "$1" "${1%.man}"' _ {} \;
}
