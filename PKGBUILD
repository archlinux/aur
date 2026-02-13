pkgname=auto-cpufreq-rust-git
_pkgname=auto-cpufreq-rust
pkgver=r573.ff890e7
pkgrel=1
pkgdesc='Automatic CPU speed & power optimizer (Rust port)'
arch=('any')
url="https://github.com/Zamanhuseyinli/auto-cpufreq-rust"
license=('LGPL-3.0')
depends=('dmidecode' 'git' 'curl' 'gcc' 'pkg-config' 'openssl')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # User confirmation prompt
    echo -e "\n\e[1;33m[?]\e[0m Do you want to run auto-cpufreq-installer? [y/N]"
    read -r -u 1 answer

    if [[ "$answer" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        echo -e "\e[1;32m[+]\e[0m Triggering script. Please enter your sudo password...\n"
        
        # Grant execution permission to the installer in the cache (srcdir)
        chmod +x auto-cpufreq-installer
        
        # Execute the installer directly from the source directory via sudo
        sudo ./auto-cpufreq-installer --install
    else
        echo -e "\e[1;31m[-]\e[0m Installation rejected by the user."
        exit 1
    fi
}

package() {
    # This section is intentionally left empty of system files.
    # It only creates a documentation entry so pacman recognizes the package as installed.
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    echo "This package acts as a trigger. Files were installed via the source installer script." > "$pkgdir/usr/share/doc/$pkgname/info"
}
