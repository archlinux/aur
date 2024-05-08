# Maintainer: James Appleton <james.appleton01@gmail.com>
pkgname="flaq"
pkgdesc="A simple CLI tool for modifying and querying metadata tags for \`.flac\` files."
pkgrel=1
pkgver="0.2.0"

makedepends=("git" "cargo" "jq")
depends=("glibc" "gcc-libs")
url="https://github.com/jmsapt/flaq"
source=("${pkgname}::git+${url}.git")
arch=("any")
license=("MIT")
sha256sums=('SKIP')

build() {
	cd "${pkgname}"
	cargo build --release
}

package() {
	# install binary
	cd "${pkgname}/target/release/"
	install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# install completion scripts
    cd ../scripts

    ls $pkgdir 
    ls "./${pkgname}.bash"

    # bash
    BASH_PATH="${pkgdir}/usr/share/bash-completion/completions"
    if [[ -e BASH_PATH ]] ; then
        install "./${pkgname}.bash" "${BASH_PATH}/${pkgname}"
        echo "Installed bash autocompletions"
    fi

    
    # fish TODO
    # if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	#     install -Dm755 "./${pkgname}.bash" "${pkgdir}/usr/share/bash/completions/${pkgname}"
    # fi

    # elv TODO
    # if [[ -r /usr/share/bash-completion/bash_completion ]]; then
	#     install -Dm755 "./${pkgname}.bash" "${pkgdir}/usr/share/bash/completions/${pkgname}"
    # fi
}

pkgver() {
	cd "${pkgname}"
	cargo metadata --format-version=1 --no-deps | jq ".packages[0].version"
}
