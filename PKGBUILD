# Maintainer: Dyredhead <danielyentin@gmail.com>

pkgname="sapm-git"
_pkgname="sapm"
pkgver="1.0.0"
pkgrel=7
pkgdesc="A System Agnostic Package Manager (SAPM) which provides basic but useful functionality"
arch=("x86_64")
url="https://github.com/Dyredhead/sapm"
license=("MIT")
depends=(gcc-libs glibc)
makedepends=("git" "cargo")
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("git+https://github.com/Dyredhead/${_pkgname}.git")
sha256sums=("SKIP")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$srcdir/$_pkgname"
    
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$_pkgname"

    cargo build --release --all-features --frozen
    
    ./target/release/man 
    ./target/release/completions
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$_pkgname"
    
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/$_pkgname"
    
    local sys_conf_dir="etc"
    local sys_data_dir="usr/share"
    local sys_bin_dir="usr/bin"
    
    local pkg_package_managers_dir="data/package_managers"
    local pkg_man_dir="data/man"
    local pkg_completions_dir="data/completions"

    install -Dm755 "./target/release/$_pkgname" "$pkgdir/$sys_bin_dir/$_pkgname"

    # User conf (only the directory is created, the actual files are installed by the user themselves)
    # install -Dm644 "./data/$_pkgname.conf" "$pkgdir/etc/$_pkgname/$_pkgname.conf"
    install -d "$pkgdir/$sys_conf_dir/$_pkgname/package_managers/"

    # SAPM conf
    # install -Dm644 "./data/$_pkgname.conf" "$pkgdir/$sys_data_dir/$_pkgname/"
    install -Dm644 "./data/template.json" "$pkgdir/$sys_data_dir/$_pkgname/template.json"

    # SAPM package managers
    install -d "$pkgdir/$sys_data_dir/$_pkgname/package_managers/"
    cp -a "$pkg_package_managers_dir/"* "$pkgdir/$sys_data_dir/$_pkgname/package_managers/"
    
    # Third party vendor package managers (only the directory is created, the actual files are installed by the third party vendors themselves)
    install -d "$pkgdir/$sys_data_dir/$_pkgname/vendor_package_managers.d/"

    # Manpages
    install -d "$pkgdir/$sys_data_dir/man/man1/"
    cp -a "$pkg_man_dir/"*".1" "$pkgdir/$sys_data_dir/man/man1/"

    # Shell Completions
    install -Dm644 "./$pkg_completions_dir/$_pkgname.bash"  "$pkgdir/$sys_data_dir/bash-completion/completions/$_pkgname.bash"
    install -Dm644 "./$pkg_completions_dir/$_pkgname.fish"  "$pkgdir/$sys_data_dir/fish/vendor_completions.d/$_pkgname.fish"
    install -Dm644 "./$pkg_completions_dir/_$_pkgname"      "$pkgdir/$sys_data_dir/zsh/site-functions/_$_pkgname"

    install -Dm644 LICENSE "$pkgdir/$sys_data_dir/licenses/$_pkgname/LICENSE"
}
