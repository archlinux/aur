#shellcheck shell=bash
# AUR package maintainer: Shadichy <shadichy@blisslabs.org>

pkgbase=clang-android
pkgname=${pkgbase}-bin
pkgver=20.0.0
pkgrel=1
pkgdesc="LLVM's C language family frontend for compiling Android components, prebuilt by Google for Android NDK."
arch=('x86_64' 'aarch64')
url="https://android.googlesource.com/platform/prebuilts/clang/host"
license=('custom:Apache 2.0 with LLVM Exception')
depends=()
provides=('clang-android')
conflicts=('clang-android')
replaces=('clang-android')
options=('!strip' '!debug')
source=("clang::shallowclone+${url}")
# Using custom download agent to shallow clone the repo
cat <<'EOF' >"DLAGENTS"
#!/bin/sh
case "$(uname -m)" in
x86_64) 
	BRANCH=main
	SUFFIX=x86
	;;
aarch64) 
	BRANCH=mirror-goog-llvm-r596125-release
	SUFFIX=arm64
	;;
esac

git clone --depth 1 --branch main --single-branch --no-tags "${1#shallowclone+}/linux-${SUFFIX}" "${2}"
EOF
chmod +x "DLAGENTS"
export DLAGENTS="shallowclone::$(realpath "./DLAGENTS") %u %o"
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/../clang"

	local latest rev
	latest=0
	for ver in clang-r*/; do
		rev=$(basename "${ver##*r}")

		if [ "$rev" -gt "$latest" ]; then
			latest=$rev
		fi
	done
	rev=$latest
	export pkgrel=$rev

	./clang-r$latest/bin/clang --version | grep version | awk -F " clang version " '{print $2}' | cut -d' ' -f1

	mv clang-r$latest $srcdir/build
}

prepare() {
	rm -rf clang
}

package() {
	local TARGET=$(realpath $pkgdir)/opt/android/clang
	mkdir -p "$TARGET"

	cd "$srcdir"

	cp -rt "$TARGET" build/.
}
