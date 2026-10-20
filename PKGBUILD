# Maintainer: detiam <dehe_tian <at> outlook <dot> com>
# Contributor: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-java-run
_pkgname=HMCL
_ver=3.16
_build=4
_pkgver=release-$_ver.$_build
_java_version=17
_jar_path="/usr/share/java/$pkgname.jar"
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that uses aur/archlinux-java-run to select java versions'
arch=('any')
url='https://github.com/HMCL-dev/HMCL'
license=('GPL3')
depends=("java-runtime>=$_java_version" 'hicolor-icon-theme' 'archlinux-java-run')
makedepends=("java-environment>=$_java_version" 'gradle')
optdepends=("java-openjfx>=$_java_version: Java that supports javaFX")
provides=('hmcl')
conflicts=('hmcl')
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('f2846ee8167f8128ebebf9ad64c8b1c07a939cd816f6eeb8be0cc271a340dd94')

prepare() {
	for patch in "${source[@]%%::*}"; do
		if [[ $patch == *.patch ]]; then
			msg2 "applying $patch"
			patch -d "$_pkgname-$_pkgver" -Np1 < "$patch"
		fi
	done
}

build() {
	cd "$_pkgname-$_pkgver"
	# shellcheck disable=SC2016
	VERSION_TYPE=stable \
		VERSION_ROOT="$_ver" BUILD_NUMBER="$_build" \
		MICROSOFT_AUTH_ID='6a3728d6-27a3-4180-99bb-479895b8f88e' MICROSOFT_AUTH_SECRET='dR.50SWwVez4-PQOF2-e_2GHmC~4Xl-p4p' \
		CURSEFORGE_API_KEY='$2a$10$o8pygPrhvKBHuuh5imL2W.LCNFhB15zBYAExXx/TqTx/Zp5px2lxu' \
		gradle build -x test --no-daemon \
			-D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

check() {
	cd "$_pkgname-$_pkgver"
	gradle test --no-daemon \
		-D 'org.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=512m'
}

package() {
	install -Dm644 "$_pkgname-$_pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm755 <(cat <<- SCRIPT
		#!/usr/bin/env sh
		set -eu

		print_usage() {
		  cat <<- EOF
			usage: \$(basename "\$0") [-h/-p] [args passed to java]

			Options:
			  -h  --help:
			    Print this message
			  --hmcl-global:
			    Use "\${XDG_DATA_HOME:-\$HOME/.local/share}/hmcl" as working directory
			EOF
		  exit 0
		}

		args=''
		for arg in "\$@" ; do
		  case "\$arg" in
		  -h|--help)
		    print_usage
		    ;;
		  --hmcl-global)
		    printf 'Global mode\n'
		    WORKDIR=\${XDG_DATA_HOME:-\$HOME/.local/share}/hmcl
		    mkdir -p "\$WORKDIR"
		    cd "\$WORKDIR" || exit 2
		    ;;
		  *)
		    args="\$args \$arg"
		    ;;
		  esac
		done

		if archlinux-java-run -f 'javafx' -a '$_java_version' -- -d javafx.base 1>/dev/null 2>&1; then
		  exec archlinux-java-run -f 'javafx' -a '$_java_version' -- -jar '$_jar_path' "\$args"
		else
		  exec archlinux-java-run -a '$_java_version' -- -jar '$_jar_path' "\$args"
		fi

		SCRIPT
	) "$pkgdir/usr/bin/$pkgname"

	install -Dm755 <(cat <<- DESKTOP
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=$_pkgname
		Comment=$pkgdesc
		Exec=$pkgname --hmcl-global %U
		Icon=$pkgname
		Terminal=false
		StartupNotify=true
		Categories=Game;
		StartupWMClass=org.jackhuang.hmcl.Launcher

		DESKTOP
	) "$pkgdir/usr/share/applications/$pkgname.desktop"

	cd "$_pkgname-$_pkgver/HMCL/build"

	# install jar
	install -Dm644 "libs/$_pkgname-$pkgver.jar" "$pkgdir/$_jar_path"
	# install icons
	local _icon _iconfile
	for _icon in 32:icon.png 64:icon@2x.png 128:icon@4x.png 256:icon@8x.png; do
		_iconfile=${_icon#*:}
		_icon=${_icon%:*}
		install -Dm644 "resources/main/assets/img/${_iconfile}" "${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname}.png"
	done
}
