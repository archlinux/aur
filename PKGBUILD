# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: David Roheim < david dot roheim at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >

# Uncomment to enable usermode support
#_with_usermode=1

pkgname=mock
pkgver=2.1
_rpmrel=1
_pkgtag=$pkgname-$pkgver-$_rpmrel
pkgrel=$_rpmrel.1
pkgdesc="A simple chroot build environment manager for building RPMs"
url="https://github.com/rpm-software-management/$pkgname"
arch=('any')
license=('GPL2')
depends=('mock-core-configs>=32.4' 'python' 'python-distro' 'python-jinja' 'python-pyroute2')
((_with_usermode)) && depends+=('usermode')
optdepends=('createrepo_c: for mockchain command'
            'dnf-plugins-core: to create RPMs for Fedora >= 24 and for Mageia'
            'lvm2: for lvm_root plugin'
            'nosync: to speed up yum/dnf database access'
            'pigz: for parallel compression of chroot cache'
            'podman: to use bootstrap images'
            'procenv: for procenv plugin'
            'python-requests: for mockchain command'
            'yum-utils: to create RPMs for Fedora <= 23 (including EL5, EL6 and EL7)')
install="$pkgname.install"
backup=("etc/$pkgname/logging.ini"
        "etc/$pkgname/site-defaults.cfg")
source=("$url/archive/$_pkgtag.tar.gz"
        "$pkgname.sysusers"
        "$pkgname.tmpfiles")
md5sums=('57ae249a57b13f64fefd5e576df6e847'
         'd277502b9a95484594f86231d073dae0'
         '1052fa4db74b59b0c195f4756bd865e8')

_prefix=/usr
_bindir=$_prefix/bin
_datadir=$_prefix/share
_mandir=$_datadir/man
_sysconfdir=/etc

prepare() {
	mv "$pkgname-$_pkgtag" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	# ArchLinux does not provides gtar symlink
	sed -e "/config_opts\['tar'\]/ s|.*|config_opts['tar'] = \"bsdtar\"|" \
	    -e "/config_opts\['plugin_conf'\]\['root_cache_opts'\]\['decompress_program'\]/ s|.*|config_opts['plugin_conf']['root_cache_opts']['decompress_program'] = \"gunzip\"|" \
	    -i "etc/$pkgname/site-defaults.cfg"

	popd >/dev/null
}

build() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	python_sitelib=$(python -c 'from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())')
	sed -r -i "py/$pkgname"{,-parse-buildlog}.py \
	    -e 's|^__VERSION__\s*=.*|__VERSION__="'$pkgver'"|' \
	    -e 's|^SYSCONFDIR\s*=.*|SYSCONFDIR="'$_sysconfdir'"|' \
	    -e 's|^PYTHONDIR\s*=.*|PYTHONDIR="'$python_sitelib'"|' \
	    -e 's|^PKGPYTHONDIR\s*=.*|PKGPYTHONDIR="'$python_sitelib'/mockbuild"|'

	# Replace /usr/libexec path in help message
	sed -r -i "py/$pkgname.py" \
	    -e 's|/usr/libexec/mock/mock|/usr/bin/mock.py|'

	sed -e "s|@VERSION@|$pkgver|" -i "docs/$pkgname"{,-parse-buildlog}.1

	python    -m compileall py/ -q
	python -O -m compileall py/ -q

	popd >/dev/null
}

package() {
	cd "$pkgname-$pkgver"

	pushd "$pkgname" >/dev/null

	mkdir -p "$pkgdir/$_bindir/"
	install -Dp -m755 py/mock.py "$pkgdir/$_bindir/"mock
	install -Dp -m755 mockchain  "$pkgdir/$_bindir/"mockchain
	install -Dp -m755 py/mock-parse-buildlog.py "$pkgdir/$_bindir/"mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir/"pam.d
	cp -Rp etc/pam/* "$pkgdir/$_sysconfdir/"pam.d/

	mkdir -p "$pkgdir/$_sysconfdir/"mock
	cp -Rp etc/mock/* "$pkgdir/$_sysconfdir/"mock/

	mkdir -p "$pkgdir/$_datadir/"bash-completion/completions
	cp -Rp etc/bash_completion.d/* "$pkgdir/$_datadir/"bash-completion/completions/
	ln -s mock "$pkgdir/$_datadir/"bash-completion/completions/mock-parse-buildlog

	mkdir -p "$pkgdir/$_sysconfdir/"pki/mock
	cp -Rp etc/pki/* "$pkgdir/$_sysconfdir/"pki/mock/

	python_sitelib=$(python -c 'from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())')
	mkdir -p "$pkgdir/$python_sitelib/"
	cp -Rp py/mockbuild "$pkgdir/$python_sitelib/"

	mkdir -p "$pkgdir/$_mandir/"man1
	cp -Rp "docs/$pkgname"{,-parse-buildlog}.1 "$pkgdir/$_mandir/"man1/

	if ((_with_usermode)); then
		mkdir -p "$pkgdir/$_sysconfdir/"security/console.apps/
		cp -Rp etc/consolehelper/$pkgname "$pkgdir/$_sysconfdir/"security/console.apps/$pkgname

		mv "$pkgdir/usr/bin/$pkgname"{,.py}
		sed -e "s|/usr/libexec/$pkgname/$pkgname|/usr/bin/$pkgname.py|" \
		    -i "$pkgdir/etc/security/console.apps/$pkgname"
		ln -s /usr/bin/consolehelper "$pkgdir/usr/bin/$pkgname"
	fi

	install -Dp -m644 docs/mock.cheat "$pkgdir/usr/share/doc/$pkgname/cheat/$pkgname"

	popd >/dev/null

	install -Dp -m644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dp -m644 "$srcdir/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}

# vim: set ft=sh ts=4 sw=4 noet:
