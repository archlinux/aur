pkgname=msvc-wine-rust-git
_gitname=msvc-wine-rust
pkgver=r9.fcd20a1
sdk_version=10.0.16299.0
tools_version=14.11.25503
pkgrel=1
pkgdesc="Cross compile Rust programs to the MSVC Windows target using Wine"
url="https://github.com/est31/${_gitname}"
license=(MIT custom)
depends=('unzip' 'wget' 'p7zip' 'wine>=2.21' 'msitools-git')
arch=(any)
options=(!strip)
source=(
	"git+https://github.com/est31/${_gitname}.git"
	'linker-paths.patch'
)
_sources=(
	11436965/d360453cfd1f34b6164afe24d1edc4b2/microsoft.visualcpp.tools.hostx86.targetx64.vsix
	11436915/aff3326c9d694e3f92617dcb3827e9f7/microsoft.visualcpp.tools.hostx86.targetx86.vsix
	11437778/36f212a9738f5888c73f46e0d25c1db7/microsoft.visualcpp.tools.hostx64.targetx64.vsix
	11437792/ade27216a21adb0795b71f57d979f758/microsoft.visualcpp.tools.hostx64.targetx86.vsix

	100107594/d176ecb4240a304d1a2af2391e8965d4/Windows%20SDK%20Desktop%20Libs%20x64-x86_en-us.msi
	100107594/d176ecb4240a304d1a2af2391e8965d4/58314d0646d7e1a25e97c902166c3155.cab

	100107594/d176ecb4240a304d1a2af2391e8965d4/Windows%20SDK%20Desktop%20Libs%20x86-x86_en-us.msi
	100107594/d176ecb4240a304d1a2af2391e8965d4/53174a8154da07099db041b9caffeaee.cab

	100120735/59fd0bbd7af55837187bbf971d485bec/Windows%20SDK%20for%20Windows%20Store%20Apps%20Libs-x86_en-us.msi
	100120735/59fd0bbd7af55837187bbf971d485bec/05047a45609f311645eebcac2739fc4c.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/0b2a4987421d95d0cb37640889aa9e9b.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/13d68b8a7b6678a368e2d13ff4027521.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/463ad1b0783ebda908fd6c16a4abfe93.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/5a22e5cde814b041749fb271547f4dd5.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/ba60f891debd633ae9c26e1372703e3c.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/e10768bb6e9d0ea730280336b697da66.cab
	100120735/59fd0bbd7af55837187bbf971d485bec/f9b24c8280986c0683fbceca5326d806.cab

	10933200/2185d21eb8245d7c79a5e74ade047c1a/microsoft.visualcpp.crt.x64.store.vsix
	10933295/e2c969895aaa4974d7d5819e9ee4cdc4/microsoft.visualcpp.crt.x86.store.vsix

	100110573/1a91d4d5ac358c110e7c874fd8c07239/Universal%20CRT%20Headers%20Libraries%20and%20Sources-x86_en-us.msi
	100110573/1a91d4d5ac358c110e7c874fd8c07239/16ab2ea2187acffa6435e334796c8c89.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/2868a02217691d527e42fe0520627bfa.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/6ee7bbee8435130a869cf971694fd9e2.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/78fa3c824c2c48bd4a49ab5969adaaf7.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/7afc7b670accd8e3cc94cfffd516f5cb.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/80dcdb79b8a5960a384abe5a217a7e3a.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/96076045170fe5db6d5dcf14b6f6688e.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/a1e2a83aa8a71c48c742eeaff6e71928.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/b2f03f34ff83ec013b9e45c7cd8e8a73.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/beb5360d2daaa3167dea7ad16c28f996.cab
	100110573/1a91d4d5ac358c110e7c874fd8c07239/f9ff50431335056fb4fbac05b8268204.cab

	100107594/d176ecb4240a304d1a2af2391e8965d4/winsdksetup.exe
)

noextract=("${_sources[@]##*/}")
source+=("${_sources[@]/#/https://download.visualstudio.microsoft.com/download/pr/}")

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

extract_license() {
	7z x -i\!u2 -so "$srcdir/winsdksetup.exe" > "$srcdir/sdk_license.rtf"
}

extract_msi() {
	mkdir -p "$1"
	(cd "$1" && msiextract "${2// /%20}")
}

extract_vsix() {
	mkdir -p "$1"
	unzip -n "$2" 'Contents/*' -d "$1"
}

prepare() {
	patch -d "$srcdir/$_gitname" -p1 < "$srcdir/linker-paths.patch"
}

build() {
	for f in microsoft.visualcpp.tools.host{x86,x64}.target{x86,x64}.vsix; do
		extract_vsix "$srcdir/sdk" "$srcdir/$f"
	done

	for f in microsoft.visualcpp.crt.{x86,x64}.store.vsix; do
		extract_vsix "$srcdir/sdk" "$srcdir/$f"
	done

	extract_msi "$srcdir/sdk" "$srcdir/Windows SDK Desktop Libs x64-x86_en-us.msi"
	extract_msi "$srcdir/sdk" "$srcdir/Windows SDK Desktop Libs x86-x86_en-us.msi"
	extract_msi "$srcdir/sdk" "$srcdir/Windows SDK for Windows Store Apps Libs-x86_en-us.msi"
	extract_msi "$srcdir/sdk" "$srcdir/Universal CRT Headers Libraries and Sources-x86_en-us.msi"

	extract_license

	rm -r "$srcdir/sdk/Program Files/Windows Kits/10/Lib/$sdk_version/ucrt/"{arm,arm64}
}

package() {
	install -d "$pkgdir/usr/share/$_gitname"

	while read file; do
		install -Dm644 "$srcdir/sdk/Contents/$file" "$pkgdir/usr/share/$_gitname/$file"
	done < <(cd "$srcdir/sdk/Contents" && find . -type f -print)

	while read file; do
		install -Dm644 "$srcdir/sdk/Program Files/Windows Kits/$file" "$pkgdir/usr/share/$_gitname/$file"
	done < <(cd "$srcdir/sdk/Program Files/Windows Kits" && find . -type f -print)

	for _arch in x86-x64 x64-x86; do
		_target=$(echo $_arch | cut -d - -f 2)
		_arch=$(echo $_arch | cut -d - -f 1)
		(
			cd "$pkgdir/usr/share/$_gitname/VC/Tools/MSVC/$tools_version/bin/Host$_arch/$_target/" &&
			while read file; do
				if [[ ! -e $file ]]; then
					ln -s ../$_arch/$file ./
				fi
			done < <(cd ../$_arch && find . -type f -iname '*.dll' -print)
		)
	done

	install -Dm644 "$srcdir/sdk_license.rtf" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 "${srcdir}/${_gitname}/linker-scripts/linker.sh" "${pkgdir}/usr/bin/link.exe"
}

# makepkg -g >> PKGBUILD
sha256sums=('SKIP'
            'b8f433e2eebf2bc542a035d3d446a5d8156b459708f40a115b9618c640b4dc39'
            '2741f4233fc7e5a5fc7324533e58e63f32d0f432975d33a3affd0ce4aa8aca0c'
            'a40b52467d3359414947e5294b6385f6af95b49c2a765e0f7f4749ac826f3a93'
            'b5d2cf115363b76a2458cea017d5c5ef43fb032643b352e37bfddd7408f06160'
            '2bbfcaaef9a1bacb947d74431d25e292c9cd1caedfb48f4e21752de07e5b7471'
            'd6c3cf3645dcb5e052da02c4acb58efb396a85b16135d94640f567a5a4d0b02b'
            'b5c4b00466ac0e14a2741cb5781f838a2ed1270fe52547cd55135df4a1209f6e'
            'f918d7dc9615b9f76f00929ed152d417c178dd4621c8c530e72ed798da58cbe0'
            '8787f2828f655c9a2eab8785f7bcdae4260f3bb45718b7a0dd95844557da49ab'
            'f4b0bf47b96ca5db9a081f270329b7eec39e13620bcdbb083777a6c146528740'
            '8bdb92034496aa5414fc96c1f649197159f5608a1ae7dd4274a9e94bbca1b951'
            '45f838f68621100a39cd1ffd52c405945cf6a454dfb64d82767b2dc1264ccf76'
            '496186b91d412297dc657c8fa39ef39c0e36a89ee37b05f07aecec9a71144265'
            '2e91e68815c10e1017681e2f35a0b8a2419bc956d83b381bf34a936cd12bcc7b'
            '2ad6121a7ffb0d02fa8cd9b9c793670af71783a4f228dea1a1a7af0fb2a15715'
            'b7e0e7cbd508785bedf05bccb98a9e590f95834b8c6476c74fe7bcd85ef95c43'
            '384c56dfb81203509fdc978a98bed504aa08859b27db7fd91af2295f308b24d2'
            'e07f0c9164c71924169a215eb87efcf8147ba948917e52a8c0a016cceeb912ef'
            '26fa5d98430b43c9e1b772d67a796e4c337fa0ddceed9572936d6e70eff14ace'
            'a7b8ae6c36b14ab17048d5ebea9d367610135463e02d87002dd01cf37faf7bf1'
            'd79b9490270a177039bd70d362c67365329f8639752248e0e42e6d87b0b61429'
            '69169ce3e27bf8aaafdc2cf1f3f4e5041ffe7efd9f8b91be4703d75d82e5f998'
            '368c48f830e5841b5d97f33e51f1d48b2064e2b85aba5ce6a7ea878e1c91091f'
            'f0c1f416287d777410730d23c365edb8d17985fce85620fcc6a10b3a446a0832'
            '428d0e74a1f1ec13dae215578376685041e6ec49bf3b92f25cbe36dd8624ae96'
            'cd0c6a71d1c61887e8caef69d6aa9fb637aae35645dd1c082addc5ad08a3b6cc'
            '427ef093e83ec4a6f9142f3e118462c45431eb78d02394125cf9a1a04613333e'
            '42639372cb357a58aed457a4ab2082cad2b94c893248858eed9658e4c6b907d4'
            '6100572b8e5bd71df63ff23ce476d36028d4edf09a0ffb4922345661b70ad6e9'
            'b06fe78ce4ef99fbf03c236dfb8919bb0c9f52ce17c86adb2515df7b3c757f18'
            '825f135371c78fba68a03c2d78520ebf7e41e8b1ae87cb3963c246bc6a7cd0dd'
            '211b7e166e08fa75d606e55471d58d231b8263885f1cb05b81a881ee292d888b'
            '664ea487a6ee1876b7384c3f1f56680e9dda80e83212a4d760994755d3add9ce')
