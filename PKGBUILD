# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgbase=brltty-git
pkgname=(
  brltty-git
  brltty-udev-generic-git
  dracut-brltty-git
  java-brltty-git
  ocaml-brltty-git
  python-brltty-git
  tcl-brltty-git
)
pkgver=6.9.r81.g83dbe770e
pkgrel=1
pkgdesc="Braille display driver for Linux/Unix (development version)"
arch=(x86_64)
url="https://brltty.app"
license=(LGPL-2.1-or-later)
makedepends=(
  alsa-lib
  at-spi2-atk
  at-spi2-core
  atk
  bluez-libs
  cython
  dbus
  dracut
  espeak-ng
  expat
  festival
  gcc-libs
  git
  glibc
  glib2
  gpm
  icu
  java-environment
  libcap
  liblouis
  libspeechd
  libxaw
  ncurses
  ocaml-ctypes
  ocaml-findlib
  pcre2
  polkit
  python-setuptools
  speech-dispatcher
  strip-nondeterminism
  systemd-libs
  tcl
)
options=(!emptydirs)
source=(${pkgbase%-git}::'git+https://github.com/brltty/brltty.git'
        "${pkgbase%-git}-6.2-systemd_sysusers_groups.patch"
        "${pkgbase%-git}-6.8-lock-brltty-user.patch"
        "${pkgbase%-git}-6.4-x11_autostart.patch"
        "${pkgbase%-git}-6.8-udev-tty-perms.rules"
)
sha512sums=('SKIP'
            '32ba91271e2247b4a330cd213ed75b591268cb99a79c2efd9ae675804faee027c6b2f782768cb2329a65fc914ca2400b2901f35ce1fc2522c6691b343799eb02'
            '2f1dba4fa5495913837972030fbcf1c265c90d481d9e0f96ff89c6cab082f7a6b0594c5c7ca6ea446eb76c8f483c7ed57ede58480898ae003261e6373440862c'
            '4871512affefbc178f4204a1b285fc2b5a05ea2d181163195d695b760e9729b3d2d00b5f052abd71379df609c3859d7cbd64128bdefd16e898bbc4368500a9a0'
            'dd210599e467a073f891554c7d3991dce90fa0506a7aef28c43a1543d94073e8d561d36c909511778d4bfcc198cac04f146966edf4462d5e553224a72864f6f3')
b2sums=('SKIP'
        '036e36d558594bb06af1eb41ff5fc9ae52ccf4bad54556c3f4f81a5e2f31f574039835e5e756455527c327a73d563a3db54a9f32e3478545a2a22c2725aaeee2'
        '76fd46571dab803c39a1663e52293c7e1ee9232b6241528e708bca072c7f9bd270c1961b960bece7f91331a259042b8dfc9a8e77f7dc463944b305700fe0c8f6'
        '4ebc07a725ef8362233a83118e93901e78943e8dae08f9358b668ff13ab88a65eb9e87c49d106a8c3d87eb62007b230e199107eacb01f92dc683335076c01309'
        '7110448b42799195abbc6f9711ebe25cdbc95056833764332c343a2d6e1201c8b590644db46a2d6612fa96740cb7da8cc7f72bb329127ae3bb6c8351efcde260')

pkgver() {
	cd "${pkgbase%-git}"
	# cutting off 'BRLTTY.' prefix that presents in the git tag
	git describe --long | sed 's/^BRLTTY.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgbase%-git}"
	patch -Np1 -i ../"${pkgbase%-git}-6.2-systemd_sysusers_groups.patch"
	patch -Np1 -i ../"${pkgbase%-git}-6.4-x11_autostart.patch"
	patch -Np1 -i ../"${pkgbase%-git}-6.8-lock-brltty-user.patch"
	./autogen
}

build() {
	local configure_options=(
		--prefix=/usr
		--sysconfdir=/etc
		--libexecdir=/usr/lib
		--localstatedir=/var
		--mandir=/usr/share/man
		--with-scripts-directory=/usr/lib/brltty
		--with-tables-directory=/usr/share/brltty
		--with-writable-directory=/run/brltty
		--enable-gpm
		--disable-stripping
	)
	# fat-lto-objects is required for non-mangled static libs
	CFLAGS+=" -ffat-lto-objects"

	cd "${pkgbase%-git}"
	./configure "${configure_options[@]}"
	make
	# make brlapi.jar deterministic
	find . -type f -iname "*.jar" -exec strip-nondeterminism {} \;
}

_pick() {
	local p="$1" f d; shift
	for f; do
		d="$srcdir/$p/${f#$pkgdir/}"
		mkdir -p "$(dirname "$d")"
		mv "$f" "$d"
		rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
	done
}

package_brltty-git() {
	depends=(
		alsa-lib libasound.so
		at-spi2-core
		bash
		bluez-libs
		dbus libdbus-1.so
		espeak-ng
		expat libexpat.so
		glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
		glibc
		gpm libgpm.so
		icu libicuuc.so
		libcap
		liblouis
		libspeechd
		libxaw
		libxt
		libx11
		libxfixes
		libxtst
		ncurses libncursesw.so
		pcre2
		polkit
		systemd-libs libsystemd.so
	)
	optdepends=(
		'brltty-udev-generic-git: for initializing brltty with generic USB devices'
		'dracut-brltty-git: for dracut modules'
		'java-brltty-git: for Java bindings'
		'ocaml-brltty-git: for OCaml bindings'
		'python-brltty-git: for Python bindings'
		'speech-dispatcher: speech-dispatcher driver'
		'tcl-brltty-git: for TCL bindings'
	)
	provides=(brltty libbrlapi.so)
	conflicts=(brltty)
	backup=(
		etc/brltty.conf
		etc/X11/xinit/xinitrc.d/90xbrlapi
	)
	install=brltty-git.install

	cd "${pkgbase%-git}"
	make INSTALL_ROOT="$pkgdir" install
	make INSTALL_ROOT="$pkgdir" install-systemd
	make INSTALL_ROOT="$pkgdir" install-udev
	make INSTALL_ROOT="$pkgdir" install-dracut
	make INSTALL_ROOT="$pkgdir" install-polkit
	install -vDm 644 Documents/${pkgbase%-git}.conf -t "$pkgdir/etc/"

	# fix directory permission and ownership
	install -vdm 755 -o root -g 102 "$pkgdir/usr/share/polkit-1/rules.d"

	install -vDm 644 ../${pkgbase%-git}-6.8-udev-tty-perms.rules "$pkgdir/usr/lib/udev/rules.d/90-brltty-tty-perms.rules"

	cd "$pkgdir"

	_pick brltty-udev-generic-git usr/lib/udev/rules.d/90-brltty-usb-generic.rules
	_pick dracut-brltty-git usr/lib/dracut/modules.d/
	_pick java-brltty-git usr/share/java/brlapi.jar
	_pick ocaml-brltty-git usr/lib/ocaml/
	_pick python-brltty-git usr/lib/python*/
	_pick python-brltty-git usr/share/brltty/Contraction/latex-access.ctb
	_pick tcl-brltty-git usr/bin/brltty-prologue.tcl
	_pick tcl-brltty-git usr/lib/brlapi-*/libbrlapi_tcl.so
	_pick tcl-brltty-git usr/lib/brlapi-*/pkgIndex.tcl
}

package_brltty-udev-generic-git() {
	pkgdesc="Generic udev rules for brltty (development version)"
	depends=(brltty-git=$pkgver)
	provides=(brltty-udev-generic)
	conflicts=(brltty-udev-generic)

	mv -v $pkgname/* "$pkgdir"
}

package_dracut-brltty-git() {
	pkgdesc+=" - dracut modules"
	depends=(
		bash
		brltty-git=$pkgver
		dracut
	)
	provides=(dracut-brltty)
	conflicts=(dracut-brltty)
	groups=(dracut-modules)

	mv -v $pkgname/* "$pkgdir"
}

package_java-brltty-git() {
	pkgdesc+=" - java bindings"
	depends=(
		brltty-git=$pkgver
		java-runtime
	)
	provides=(java-brltty)
	conflicts=(java-brltty)

	mv -v $pkgname/* "$pkgdir"
}

package_ocaml-brltty-git() {
	pkgdesc+=" - OCaml bindings"
	depends=(
		brltty-git=$pkgver
		glibc
		ocaml
	)
	provides=(ocaml-brltty)
	conflicts=(ocaml-brltty)

	mv -v $pkgname/* "$pkgdir"
}

package_python-brltty-git() {
	pkgdesc+=" - Python bindings"
	depends=(
		brltty-git=$pkgver
		glibc
		python
	)
	provides=(python-brltty)
	conflicts=(python-brltty)

	mv -v $pkgname/* "$pkgdir"
}

package_tcl-brltty-git() {
	pkgdesc+=" - TCL integration"
	depends=(
		brltty-git=$pkgver
		glibc
		tcl
	)
	provides=(tcl-brltty)
	conflicts=(tcl-brltty)

	mv -v $pkgname/* "$pkgdir"
}
