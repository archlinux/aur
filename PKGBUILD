# Maintainer: Marc Jose <Hering2007@web.de>
pkgname=arch-security
pkgver=1.0
pkgrel=1
pkgdesc="Display current vulnerabilities for installed packages and scan for some possible security issues"
arch=('any')
url="https://gitlab.marc-jose.de/marc.jose/$pkgname"
license=('MIT')
makedepends=('git' 'awk' 'coreutils' 'grep' 'python-pip')
provides=("$pkgname")
depends=('python' 'pacman' 'sudo')
source=("git+https://gitlab.marc-jose.de/marc.jose/$pkgname.git"
        'arch-security.hook'
        'arch-security.sh')
sha512sums=('SKIP'
            '8e107f81db0345c320d8291a5e210685ced10ab0799d63a84946146ef721a340feb7dcdda8b7c849e4a837f8cbbe38653d0a8a9a2531237a2494661ff930f91c'
            '720cb8df7e219b7609885ab3384172acfdc26ae87f4d5004efd1237139bc63093ace4e5f2d769d7393e071d4e89b3954d2d5d3c80841d95cdca25ba03bd4bdf1')
            
package() {
    # If hooks are not enabled then do that now
    HOOK_DIR="$(/usr/bin/cat '/etc/pacman.conf' | /usr/bin/grep 'HookDir')"
    if [[ "${HOOK_DIR}" == "#"* ]]; then
        sudo /usr/bin/sed -i 's/^\#[\s]*HookDir/HookDir/' '/etc/pacman.conf'
    fi
    
    # If not hook-dir is set then do that now as well
    HOOK_DIR="$(/usr/bin/cat '/etc/pacman.conf' | /usr/bin/grep 'HookDir' | /usr/bin/awk '{print $3}')"
    if [[ -z "${HOOK_DIR}" ]]; then
        sudo /usr/bin/sed -i 's/^HookDir.*/HookDir      = \/etc\/pacman\.d\/hooks/' '/etc/pacman.conf'
        /usr/bin/mkdir -p '/etc/pacman.d/hooks'
    fi
    
    # Get actual hook dir
    HOOK_DIR="$(/usr/bin/cat '/etc/pacman.conf' | /usr/bin/grep 'HookDir' | /usr/bin/awk '{print $3}')"
    
    # Install files
    install     -Dm644 'arch-security.hook'                  "$pkgdir/${HOOK_DIR}/arch-security.hook"
    install     -Dm644 "$srcdir/$pkgname/LICENSE"            "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install     -Dm777 'arch-security.sh'                    "$pkgdir/usr/bin/arch-security"
    install     -Dm744 "$srcdir/$pkgname/update_database.py" "$pkgdir/opt/$pkgname/update_database.py"
    install     -Dm744 "$srcdir/$pkgname/arch-security.py"   "$pkgdir/opt/$pkgname/arch-security.py"
    /usr/bin/cp -r     "$srcdir/$pkgname/security_tests"     "$pkgdir/opt/$pkgname/security_tests"
    install     -Dm644 "$srcdir/$pkgname/requirements.txt"   "$pkgdir/opt/$pkgname/requirements.txt"
    /usr/bin/python3 -m venv "$pkgdir/opt/$pkgname/env" || /usr/bin/virtualenv -p python3 "$pkgdir/opt/$pkgname/env"
    $pkgdir/opt/$pkgname/env/bin/pip3 install --quiet -r "$pkgdir/opt/$pkgname/requirements.txt"
    /usr/bin/touch "$pkgdir/opt/$pkgname/database.sqli"
    /usr/bin/chmod g+r,o+r "$pkgdir/opt/$pkgname/database.sqli"
}
