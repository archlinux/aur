# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_gitname=foundry
_pkgbase=gnome-${_gitname}
pkgname=${_pkgbase}-git
pkgver=r1757.3bd3bfc
pkgrel=1
pkgdesc="A GNOME library providing IDE capabilities (git version)"
groups=(gnome-extra)
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/foundry"
license=('LGPL-2.1-only')
depends=(
	cmark
	editorconfig-core-c
	flatpak
	gcc-libs
	glib2
	glibc
	gobject-introspection
	gom
	gtk4
	gtksourceview5
	json-glib
	libdex'>=0.11'
	libgit2
	libpeas-2
	libssh2
	libsysprof-capture
	libxml2
	libyaml
	template-glib'>=3.37'
	vte4
	webkitgtk-6.0
)
makedepends=(
	git
	glib2-devel
	lua51-lgi
	meson
	python-typogrify
	sysprof
	valabind
)
optdepends=(
	astrojs-language-server
	autotools
	bash-language-server
	blueprint-compiler
	buildstream
	cargo
	clangd
	cmake
	codesearch
	codespell
	ctags
	devhelp
	deviced
	distrobox
	doap
	dub
	elixir-ls
	eslint
	flake8
	gdiagnose
	gettext
	glsl-language-server
	go
	gopls
	gradle
	nodejs-intelephense
	jdtls
	jedi-language-server
	jhbuild
	lua-language-server
	make
	maven
	meson
	mesonlsp
	npm
	#ollama
	phpize
	podman
	python-lsp-server
	pyrefly
	qemu
	qemu-user-static
	ruff
	rust-analyzer
	serve-d
	shellcheck
	sourcekit-lsp
	libspelling
	toolbox
	typescript-language-server
	vala-language-server
	vhdl-language-server
	waf
	zls
)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	local meson_options=(
		#-D feature-llm=true
		-D docs=true
	)

	arch-meson "${_gitname}" 'build/' "${meson_options[@]}"
	meson compile -C 'build/'
}

check() (
	meson test -C 'build/' --print-errorlogs
)

package() {
	meson install -C 'build/' --destdir "${pkgdir}"
}
