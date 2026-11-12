# Maintainer: Dominik Kummer <admin@arkades.org>
# Experimental alternative launcher for the TeX Live minted installation.
#
# This package deliberately does not own /usr/bin/latexminted.  That symlink
# remains owned by texlive-latexextra and is switched by the install script.
#
# Source branch: conditional-local-python

pkgname=texlive-minted-git
pkgver=3.8.0.r355.g7cf9042
pkgrel=2
pkgdesc='Git version of minted with conditional local Python selection'
arch=('any')
url='https://github.com/arkadesOrg/minted'
license=('LPPL-1.3c')
depends=('python>=3.8' 'texlive-latexextra')
makedepends=('git' 'python')
provides=('texlive-minted')
install="${pkgname}.install"
source=("minted::git+https://github.com/arkadesOrg/minted.git#branch=conditional-local-python")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/minted"

    # local upstream_version revision commit
    upstream_version=$(grep -m1 -oE 'v[0-9]+([.][0-9]+)+' \
        latex/minted/minted.sty | sed 's/^v//')
    revision=$(git rev-list --count HEAD)
    commit=$(git rev-parse --short=7 HEAD)

    [[ -n "${upstream_version}" ]] || return 1
    printf '%s.r%s.g%s\n' "${upstream_version}" "${revision}" "${commit}"
}

prepare() {
    # The branch launcher normally searches for wheels beside itself.  This
    # package intentionally reuses the wheels owned by texlive-latexextra,
    # rather than copying or claiming those files a second time.
    python - "${srcdir}/minted/latex/restricted/latexminted.py" <<'PY'
from pathlib import Path
import sys

launcher = Path(sys.argv[1])
source = launcher.read_text(encoding="utf-8")
needle = "if not wheel_paths or any(pkg not in wheel_packages for pkg in required_wheel_packages):"
replacement = """if not wheel_paths or any(pkg not in wheel_packages for pkg in required_wheel_packages):
    # Arch package variant: use the wheels owned by texlive-latexextra.
    wheel_paths = [
        p for p in Path('/usr/share/texmf-dist/scripts/minted').glob('*.whl')
        if p.name.split('-', 1)[0].lower().replace('_', '-') in required_wheel_packages
    ]
    wheel_packages = {
        p.name.split('-', 1)[0].lower().replace('_', '-')
        for p in wheel_paths
    }
if not wheel_paths or any(pkg not in wheel_packages for pkg in required_wheel_packages):"""
if source.count(needle) != 1:
    raise SystemExit(
        "Could not find exactly one expected wheel-discovery statement; "
        "review the upstream launcher before packaging"
    )
launcher.write_text(source.replace(needle, replacement), encoding="utf-8")
PY
}

check() {
    cd "${srcdir}/minted"
    python -m unittest discover \
        -s latex/restricted/tests \
        -p 'test_latexminted_bootstrap.py'
}

package() {
    cd "${srcdir}/minted"

    install -Dm644 latex/minted/minted.sty \
        "${pkgdir}/usr/share/texmf/tex/latex/minted/minted.sty"

    install -Dm755 latex/restricted/latexminted.py \
        "${pkgdir}/usr/share/texmf/scripts/minted/latexminted.py"

}
