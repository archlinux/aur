# Maintainer: awataki <awataki1206 at gmail.com>

## Mozc compile option
build_mode=Release
mozc_commit=f09c4e2ed57484cbc1dae75c4e02db2235718365
japanese_usa1ge_dictionary_commit=e5b3425575734c323e1d947009dd74709437b684
gyp_commit=4ec6c4e3a94bd04a6da2858163d40b2429b8aad1
_protobuf_rev=92a7e778e7394386f413cec28d67a07630f784b1

pkgbase=fcitx5-mozc
pkgname=fcitx5-mozc
pkgdesc="Fcitx5 Module of A Japanese Input Method for Chromium OS, Windows, Mac and Linux (the Open Source Edition of Google Japanese Input)"
pkgver=2.23.2815.102+0.0.0.20200626
pkgrel=3
arch=('x86_64')
url="https://github.com/fcitx/mozc"
license=('custom')
depends=('qt5-base' 'fcitx5' 'zinnia')
makedepends=('pkg-config' 'python2' 'curl' 'gtk2' 'mesa' 'subversion' 'ninja' 'git' 'clang')
replaces=('mozc-fcitx')
conflicts=('mozc' 'mozc-server' 'mozc-utils-gui' 'mozc-fcitx' 'fcitx-mozc')
source=(
	git+https://github.com/fcitx/mozc.git#commit=${mozc_commit}
	japanese_usage_dictionary::git+https://github.com/hiroyuki-komatsu/japanese-usage-dictionary.git#commit=${japanese_usage_dictionary_commit}
	gyp::git+https://chromium.googlesource.com/external/gyp#commit=${gyp_commit}
	git+https://github.com/google/protobuf.git#commit=${_protobuf_rev}
	pr444.patch::https://fars.ee/2is4
	https://downloads.sourceforge.net/pnsft-aur/x-ken-all-201810.zip
	https://downloads.sourceforge.net/pnsft-aur/jigyosyo-201810.zip
	https://download.fcitx-im.org/fcitx-mozc/fcitx-mozc-icon.tar.gz
)
sha512sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

prepare() {
	cd mozc/src
	patch -Np2 < ../../pr444.patch

	# Disable fcitx4 specific building
	rm unix/fcitx -rf

	# Adjust to use python2
	find . -name  \*.py        -type f -exec sed -i -e "1s|python.*$|python2|"  {} +
	find . -regex '.*\.gypi?$' -type f -exec sed -i -e "s|'python'|'python2'|g" {} +

	# Generate zip code seed
	msg "Generating zip code seed..."
	PYTHONPATH="$PWD:$PYTHONPATH" python2 dictionary/gen_zip_code_seed.py --zip_code="${srcdir}/x-ken-all.csv" --jigyosyo="${srcdir}/JIGYOSYO.CSV" >> data/dictionary_oss/dictionary09.txt
	msg "Done."

	# Copy third party deps
	cd "$srcdir"
	for dep in gyp protobuf japanese_usage_dictionary
	do
		cp -a $dep mozc/src/third_party/
	done
}

build() {
	# Fix compatibility with google-glog 0.3.3 (symbol conflict)
	CFLAGS="${CFLAGS} -fvisibility=hidden"
	CXXFLAGS="${CXXFLAGS} -fvisibility=hidden"

	cd mozc/src

	_targets="server/server.gyp:mozc_server gui/gui.gyp:mozc_tool unix/fcitx5/fcitx5.gyp:fcitx5-mozc"

	QTDIR=/usr GYP_DEFINES="document_dir=/usr/share/licenses/$pkgname use_libzinnia=1" python2 build_mozc.py gyp
	python2 build_mozc.py build -c $build_mode $_targets

	# Extract license part of mozc
	head -n 29 server/mozc_server.cc > LICENSE
}

package() {
	cd mozc/src
	install -D -m 755 out_linux/${build_mode}/mozc_server "${pkgdir}/usr/lib/mozc/mozc_server"
	install    -m 755 out_linux/${build_mode}/mozc_tool   "${pkgdir}/usr/lib/mozc/mozc_tool"
	install -d "${pkgdir}/usr/share/licenses/$pkgname/"
	install -m 644 LICENSE data/installer/*.html "${pkgdir}/usr/share/licenses/${pkgname}/"

	for mofile in out_linux/${build_mode}/gen/unix/fcitx5/po/*.mo
	do
		filename=`basename $mofile`
		lang=${filename/.mo/}
		install -D -m 644 "$mofile" "${pkgdir}/usr/share/locale/$lang/LC_MESSAGES/fcitx5-mozc.mo"
	done

	install -D -m 755 out_linux/${build_mode}/fcitx5-mozc.so "${pkgdir}/usr/lib/fcitx5/fcitx5-mozc.so"
	install -D -m 644 unix/fcitx5/mozc-addon.conf "${pkgdir}/usr/share/fcitx5/addon/mozc-addon.conf"
	install -D -m 644 unix/fcitx5/mozc.conf "${pkgdir}/usr/share/fcitx5/inputmethod/mozc.conf"
	install -d "${pkgdir}/usr/share/fcitx5/mozc/icon"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_full.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-alpha_full.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-alpha_half.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-alpha_half.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-direct.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-direct.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-hiragana.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-hiragana.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_full.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-katakana_full.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-katakana_half.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-katakana_half.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-dictionary.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-dictionary.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-properties.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-properties.png"
	install -m 644 "$srcdir/fcitx-mozc-icons/mozc-tool.png" "${pkgdir}/usr/share/fcitx5/mozc/icon/mozc-tool.png"
}
