# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=scheme-langserver
pkgver=2.1.8
pkgrel=1
pkgdesc="A language server for Scheme"
# Chez fasl objects are machine specific (ta6le).
arch=('x86_64')
url="https://github.com/ufo5260987423/${pkgname}"
license=('MIT')
depends=('chez-scheme')
makedepends=('akku')
conflicts=("${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1d66cec9b086fe5886f3df951716c6772aa5206fd73a6be48515e2a61c57134')

_libdirs() {
    printf '%s::%s' "${srcdir}/${pkgname}-${pkgver}/.akku/lib" \
                    "${srcdir}/${pkgname}-${pkgver}/.akku/libobj"
}

prepare() {
    cd "${pkgname}-${pkgver}"

    # Fetch the R6RS libraries pinned in Akku.lock.
    akku install

    # run.ss shells out to git describe and otherwise reads ./.version from
    # the current directory, which is the user's project once installed.
    echo "${pkgver}" > .version

    # tests/integration/test-shutdown-exit.sps shells out to `scheme`, which
    # is what upstream's Chez build installs. Arch names the binary `chez`.
    printf '#!/bin/sh\n\nexec /usr/bin/chez "$@"\n' > .akku/bin/scheme
    chmod 755 .akku/bin/scheme
}

build() {
    cd "${pkgname}-${pkgver}"

    # Upstream links a standalone executable with chez-exe, which needs Chez
    # kernel objects that the chez-scheme package does not ship. Compiling to
    # fasl objects and launching them through the system Chez gives the same
    # startup time without that dependency.
    # Compiling into .akku/libobj is where akku's own activate script expects
    # the objects, so the tests that source it get the compiled code too.
    mkdir -p .akku/libobj
    chez --script /dev/stdin <<EOF
(library-directories (list (cons ".akku/lib" ".akku/libobj")))
(compile-imported-libraries #t)
(generate-wpo-files #f)
(compile-program "run.ss" "run.so")
EOF
}

check() {
    cd "${pkgname}-${pkgver}"
    export CHEZSCHEMELIBDIRS="$(_libdirs)"
    unset CHEZSCHEMELIBEXTS

    # tests/analysis/test-tokenizer-diagnoses.sps writes here without creating
    # the directory first.
    mkdir -p /tmp/test-tokenizer

    # The first three are excluded by upstream test.sh as well. The last two
    # are LSP stress harnesses; each runs for over twenty minutes and peaks
    # near 2 GB, which is too much for a package check.
    local skip=(
        tests/integration/output-identifier-types.sps
        tests/integration/performance.sps
        tests/analysis/identifier/test-auto-macro-resolve.sps
        tests/robustness/robustness-editor-fuzz.sps
        tests/robustness/robustness-lsp-replay.sps
    )

    local test status=0
    while read -r test; do
        if [[ " ${skip[*]} " == *" ${test} "* ]]; then
            continue
        fi
        chez --quiet "${test}" || status=1
    done < <(find tests -name '*.sps' | sort)

    return "${status}"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 run.so "${pkgdir}/usr/lib/${pkgname}/run.so"
    install -Dm644 .version "${pkgdir}/usr/lib/${pkgname}/.version"

    cp -rL --no-preserve=ownership .akku/lib "${pkgdir}/usr/lib/${pkgname}/lib"
    cp -r --no-preserve=ownership .akku/libobj "${pkgdir}/usr/lib/${pkgname}/libobj"

    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/bin/sh

exec /usr/bin/chez \\
    --libdirs '/usr/lib/${pkgname}/lib::/usr/lib/${pkgname}/libobj' \\
    --program /usr/lib/${pkgname}/run.so "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 doc/build-and-startup.md "${pkgdir}/usr/share/doc/${pkgname}/build-and-startup.md"
}
