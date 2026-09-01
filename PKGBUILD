# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=grubforge
pkgver=1.1.1
pkgrel=1
pkgdesc="A terminal UI for managing and customizing the GRUB bootloader — safely, intuitively, and beautifully"
arch=('any')
url="https://github.com/jetomev/grubforge"
license=('GPL3')
# polkit (v1.1.0): grubForge runs as your user and asks polkit for permission
# when a change needs root, instead of requiring the whole app to run as root.
depends=('python' 'python-textual' 'python-rich' 'polkit')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('b4bb8b1fe6fd6ddb88cdae12f731c2d3dee1d47f733297cce0f9e30607b90abb'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   gpg --keyserver keys.openpgp.org --recv-keys 32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Headless smoke test: import AND mount the app under Textual's test
    # harness. The v1.0.2 import smoke caught Textual API breaks (the v1.0.1
    # F16 Static.Clicked removal); v1.0.3 widens it to a full headless mount
    # so build-time failures beyond import — CSS parse errors, bad widget ids,
    # on_mount crashes — are caught too. We never ship a package that imports
    # but won't launch. (With no /etc/default/grub or /boot in the build env,
    # the app mounts cleanly in mock mode.)
    #
    # PYTHONDONTWRITEBYTECODE=1 prevents Python from writing .pyc cache files
    # into the source tree during the smoke. Without this, those .pyc files
    # get picked up by package()'s `cp -r grubforge` below, land at
    # /usr/lib/grubforge/.../__pycache__/, and conflict on install with the
    # .pyc files that user-runtime Python generates at the same paths
    # (pacman refuses to overwrite untracked-but-existing files).
    PYTHONDONTWRITEBYTECODE=1 python -c "
import sys, asyncio
sys.path.insert(0, '.')
from grubforge.app import GrubForgeApp
async def _smoke():
    app = GrubForgeApp()
    async with app.run_test() as pilot:
        await pilot.pause()
asyncio.run(_smoke())
print('grubforge headless mount OK')
"

    # v1.1.0: the privileged helper is the security boundary, so verify at
    # build time that it still refuses what it must refuse. These run as the
    # build user, not root — the first check below is exactly that gate.
    PYTHONDONTWRITEBYTECODE=1 python -c "
import subprocess, sys

def refuses(args, why):
    r = subprocess.run(['python', 'helper/grubforge-helper'] + args,
                       capture_output=True, text=True, input='')
    if r.returncode == 0:
        print('FAIL: helper accepted ' + why); sys.exit(1)

refuses(['regenerate'],              'a verb while not root')
refuses(['definitely-not-a-verb'],   'an unknown verb')
refuses([],                          'no verb at all')
print('grubforge helper refusal checks OK')
"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Defensive cleanup: ensure no stray .pyc caches make it into the package.
    # Belt-and-suspenders alongside check()'s PYTHONDONTWRITEBYTECODE.
    find grubforge -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true

    # Install the Python package
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r grubforge "${pkgdir}/usr/lib/${pkgname}/"
    cp main.py "${pkgdir}/usr/lib/${pkgname}/"

    # Install the launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec python /usr/lib/grubforge/main.py "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # v1.1.0 — the privilege model.
    #
    # The helper is the only thing that runs as root, and pkexec will only run
    # the exact path named in the polkit policy, so these two must agree:
    #   /usr/lib/grubforge/grubforge-helper
    # Owned by root and not writable by anyone else (makepkg gives root:root);
    # a user-writable root helper would defeat the entire point.
    install -Dm755 helper/grubforge-helper \
        "${pkgdir}/usr/lib/${pkgname}/grubforge-helper"

    install -Dm644 polkit/org.kognogos.grubforge.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.kognogos.grubforge.policy"

    # Install the man page
    install -Dm644 grubforge.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"

    # Install the license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
