# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
_pkgname=GeekbenchAI
pkgname=geekbench-ai
pkgver=1.6.0
pkgrel=1
pkgdesc="Geekbench AI is a cross-platform AI benchmark that uses real-world machine learning tasks to evaluate AI workload performance"
arch=('x86_64')
url="https://www.geekbench.com/ai/"
license=('LicenseRef-Geekbench-AI-V1')
depends=('gcc-libs' 'bash' 'ocl-icd' 'onetbb' 'glibc')
makedepends=('patchelf')
source=("https://cdn.geekbench.com/GeekbenchAI-${pkgver}-Linux.tar.gz"
	LicenseRef-EULA-AI-V1.txt)
install=$pkgname.install
sha256sums=('6ba6a080bc8806f3c9f2082e5ca4b3a82c3f07028ff47ded5129b004e181c1f9'
            '825511a88bcb55bf7554e00378c416d4df2de28d70f912a9dfc262f2bbc49050')

package() {
	cd "$srcdir/$_pkgname-$pkgver-Linux/"
	# Create folders
	install -dm755 "$pkgdir/usr/lib/$pkgname"
	install -dm755 "$pkgdir/usr/bin"
	# Install files and set 755 on libraries
	cp -a -r * "$pkgdir/usr/lib/$pkgname/"
	pushd "$pkgdir/usr/lib/$pkgname"
	for file in *.so*;
	do
		chmod 755 $file
	done
	# Create launch script
	cat >> "$pkgdir/usr/bin/banff" <<EOF
#!/usr/bin/env bash
LD_LIBRARY_PATH=/usr/lib/$pkgname:$LD_LIBRARY_PATH /usr/lib/$pkgname/banff "\$@"
EOF
	chmod 755 "$pkgdir/usr/bin/banff"
	# Remove insecure RUNPATH in binaries
	for binary in banff{,_avx2,_x86_64};
	do
		patchelf --remove-rpath $binary
	done
	popd
	install -Dm644 "$srcdir/LicenseRef-EULA-AI-V1.txt" "$pkgdir/usr/share/licenses/$pkgname/eula-ai-v1.txt"
}
