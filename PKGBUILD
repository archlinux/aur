# Maintainer: Yakov Till <yakov.till@gmail.com>

# Upstream ships no license file and states no license terms anywhere, so the
# terms are genuinely unknown rather than merely non-SPDX; 'custom' would imply
# a license file that does not exist.

pkgname=optmem-git
pkgver=r37.d618a3a
pkgrel=2
_toolpath=/usr/bin/memo
pkgdesc="Permanent memory for AI agents: an append-only memory store and a 426-token prompt"
arch=('any')
url="https://github.com/VictorTaelin/OptMem"
license=('unknown')
depends=('python')
makedepends=('git')
provides=('optmem')
conflicts=('optmem')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    # Render upstream's own prompt template against this package's paths, so the
    # shipped block is what `memo init` prints here rather than the README's copy,
    # which hardcodes upstream's curl-installer location. A user who overrides
    # MEMORY_DIR makes the block's data line inaccurate; `memo init` stays correct.
    python - memo "${_toolpath}" > prompt.md <<'PY'
import importlib.machinery, importlib.util, sys
loader = importlib.machinery.SourceFileLoader("optmem_memo", sys.argv[1])
spec = importlib.util.spec_from_loader(loader.name, loader)
module = importlib.util.module_from_spec(spec)
loader.exec_module(module)
print(module.TEMPLATE.format(memo=sys.argv[2],
                             data="~/.optmem/memory",
                             chars=module.ENTRY_CHARS).rstrip())
PY
}

check() {
    cd "${srcdir}/${pkgname}"
    python test.py
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 memo "${pkgdir}${_toolpath}"
    # Not under /usr/share/doc: this is meant to be referenced by a live agent
    # config, and a builder with !docs in makepkg.conf would strip it from there.
    install -Dm644 prompt.md "${pkgdir}/usr/share/${pkgname%-git}/prompt.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
}
