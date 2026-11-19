# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Ilia Maslakov <il.smind@gmail.com>

pkgauthor=blue-panels
pkgbase=bluerig
pkgname=(${pkgbase} ${pkgbase}-lua)
pkgver=1.0.2
pkgrel=1
pkgdesc='A terminal IDE grown out of mcedit'

arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later')
url="https://github.com/${pkgauthor}/${pkgbase}"

makedepends=('meson' 'pkgconf' 'gettext' 'glib2' 'json-glib' 'slang' 'gpm' 'lua' 'libx11' 'check')

options=('!emptydirs')

source=("${pkgbase}-${pkgver}.tgz::${url}/releases/download/${pkgbase}-${pkgver}/${pkgbase}-${pkgver}.tar.gz")
b2sums=('a4601c7bdc819c07bf076953417ec8705c8f39799b5040b10fb9f14a055d1dff9e899ab86a4ea1474dc80c4addb23d65c402eee3676343d13cf09f68837f164f')

build() {
	arch-meson "${pkgbase}-${pkgver}" build \
		-Dscreen=slang \
		-Dplugins_dir=/usr/lib/${pkgbase}/plugins \
		-Druntime_plugins_dir=/usr/lib/${pkgbase}/runtime-plugins \
		-Dlua=enabled

  meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package_bluerig() {
	pkgdesc="A terminal IDE grown out of mcedit"

	depends=('glib2' 'json-glib' 'slang' 'gpm')
	optdepends=("${pkgbase}-lua: the Lua runtime and the editor scripts"
				'libx11: keyboard modifiers under X'
				'aspell: spell checking'
				'hunspell: spell checking'
				'ctags: the tag index the editor reads')

	backup=("etc/${pkgbase}/${pkgbase}.menu"
			"etc/${pkgbase}/ctags.keymap"
			"etc/${pkgbase}/keymap.default.ini"
			"etc/${pkgbase}/keymap.emacs.ini"
			"etc/${pkgbase}/keymap.ini"
			"etc/${pkgbase}/keymap.vim.ini"
			"etc/${pkgbase}/spell.keymap")

	meson install -C build --destdir "${pkgdir}"

	rm -rf "${pkgdir}/usr/lib/${pkgbase}/runtime-plugins"
	rm -rf "${pkgdir}/usr/share/${pkgbase}/lua"

	# keymap.ini is installed as a symlink to keymap.default.ini, and pacman
	# cannot keep a symlink through the backup mechanism: the user's edits would
	# be lost on upgrade. Ship it as a file. (Arch FS#50889)
	rm "${pkgdir}/etc/${pkgbase}"/keymap.ini
	cp "${pkgdir}/etc/${pkgbase}"/keymap{.default,}.ini

	install -Dm644 "${pkgbase}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -Dm644 "${pkgbase}-${pkgver}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

package_bluerig-lua() {
	pkgdesc="Lua runtime and scripts for ${pkgbase}"

	depends=("${pkgbase}=${pkgver}-${pkgrel}" 'glib2' 'lua54')

	meson install -C build --destdir "${pkgdir}"

	rm -rf "${pkgdir}/etc" "${pkgdir}/usr/bin"

	# Keep the runtime plugin and the Lua scripts, drop everything else the
	# install put here: pacman refuses two packages that own the same file.
	find "${pkgdir}/usr/lib" -mindepth 1 -maxdepth 1 ! -name ${pkgbase} -exec rm -rf {} +
	find "${pkgdir}/usr/lib/${pkgbase}" -mindepth 1 -maxdepth 1 ! -name runtime-plugins -exec rm -rf {} +
	find "${pkgdir}/usr/share" -mindepth 1 -maxdepth 1 ! -name ${pkgbase} -exec rm -rf {} +
	find "${pkgdir}/usr/share/${pkgbase}" -mindepth 1 -maxdepth 1 ! -name lua -exec rm -rf {} +

	install -Dm644 "${pkgbase}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
