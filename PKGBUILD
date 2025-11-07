# Contributor: micsproul at large search corporation's mail service.
# Contributor: Mohammad Alsaleh <msal@tormail.org>
# Contributor: Steven Allen <steven@stebalien.com>

pkgname=rust-nightly-bin
pkgver=1.93.0_2025.11.06
pkgrel=1
arch=('x86_64')
pkgdesc='A Programming language focused on safety, speed and concurrency'
url='https://www.rust-lang.org/'
license=("Apache-2.0 OR MIT")
provides=(rust cargo rust-docs)
conflicts=(rust cargo rust-docs)
depends=(gcc-libs lld zlib sh python ) #llvm-libs
optdepends=(llvm llvm-libs wasm-component-ld)
source=("rust-nightly-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz::https://static.rust-lang.org/dist/rust-nightly-${CARCH}-unknown-linux-gnu.tar.gz"
)

sha256sums=('SKIP')
options=(staticlibs !debug)

pkgver() {
  cd ${srcdir}/rust-nightly-${CARCH}-unknown-linux-gnu
  ver="$(expr "$(cat version)" : '\(.*\)-nightly')"
  date="$(expr "$(cat version)" : '.* \(.*\))')"
  echo "${ver}_${date//\-/.}"
}

package() {
    cd rust-nightly-${CARCH}-unknown-linux-gnu
    ./install.sh \
        --disable-ldconfig \
        --destdir="${pkgdir}" \
        --prefix=/usr/ \
        --components=rustc,cargo,llvm-tools-preview,rust-std-${CARCH}-unknown-linux-gnu,rust-analysis-x86_64-unknown-linux-gnu


    install -dm755 "${pkgdir}/usr/share/bash-completion/"
    mv "${pkgdir}/usr/etc/bash_completion.d/" "${pkgdir}/usr/share/bash-completion/completions/"

    install -dm755 "${pkgdir}/usr/share/licenses/rust-nightly-bin/"{rust,cargo}

    # use system bins
    for _f in $(ls "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/gcc-ld);do
      ln -svf /usr/bin/$_f -t "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/gcc-ld
    done
    for _f in $(ls "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin|grep -v gcc-ld);do
      ln -svf /usr/bin/$_f -t "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin
    done
    ln -svf /usr/bin/lld "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/rust-lld
    ln -svf /usr/bin/llvm-objcopy "${pkgdir}"/usr/lib/rustlib/${CARCH}-unknown-linux-gnu/bin/rust-objcopy
    # system llvm-libs breaks lld -r rustc
    # Remove unused files
    rm "${pkgdir}/usr/lib/rustlib/"{manifest-*,install.log,uninstall.sh,components,rust-installer-version}
    rm "${pkgdir}"/usr/etc/*.json
    # dedup .so (https://github.com/rust-lang/rust/issues/37971)
    find "${pkgdir}/usr/lib/rustlib/" -name "*.so*" -exec ln -rfs -t "${pkgdir}/usr/lib/" {} +
}
