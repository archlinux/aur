#! /bin/bash

# Contributors:
# - Alberto Salvia Novella (es20490446e.wordpress.com)
# - Bryan Malyn <bim9262@gmail.com>
# - Spider Mario <spidermario@free.fr>
# - Taras Shpot <mrshpot@gmail.com>
# - Tatsuyuki Ishi <ishitatsuyuki@gmail.com>


pkgbase="rust-git"
url="https://github.com/rust-lang/rust"

epoch=3
pkgver=1.82.0.r262681.e57f3090aec
pkgrel=1
arch=("x86_64")


pkgname=(
	"rust-git"
	"rust-src-git"
)


license=(
	"Apache"
	"MIT"
)


source=(
	"git+${url}.git"
	"config.toml"
)


sha1sums=(
	"SKIP"
	"e78e224ddb47cb7fb1e334ae62bc02ab6a44bc2b"
)


makedepends=(
	"clang"
	"cmake"
	"git"
	"libffi"
	"lld"
	"llvm"
	"ninja"
	"perl"
	"python"
)


depends=(
	"curl"
	"gcc"
	"gcc-libs"
	"libgit2"
	"libssh2"
	"llvm-libs"
	"openssl"
	"zlib"
)


options=(
	"!buildflags"
	"!emptydirs"
	"!lto"
)


pkgver () {
	cd "${srcdir}/rust"
	echo "$(cat "${srcdir}/rust/src/version").r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}


prepare () {
	FixSource
	LinkConfig
}


FixSource () {
	FixBashCompletions
	FixLibexec
}


FixSource () {
	FixBashCompletions
	FixLibexec
	FixLlvmTargets
}


FixBashCompletions () {
	sed --in-place \
		's|etc/bash_completion.d|share/bash-completion/completions|' \
		"${srcdir}/rust/src/bootstrap/src/core/build_steps/dist.rs"
}


FixLibexec () {
	sed --in-place \
		's|"libexec"|"lib"|' \
		"${srcdir}/rust/src/bootstrap/src/core/build_steps/dist.rs"

	sed --in-place \
		's|"libexec"|"lib"|' \
		"${srcdir}/rust/src/bootstrap/src/core/build_steps/tool.rs"
}


FixLlvmTargets () {
	# Defines proper "pc" targets, as:
	# - Crates expect "unknown" targets.
	# - Firefox expects "rustc --version --verbose" to equal "rustc --print target-list".

	AddAliasFunction
	SelectAliasesAsTargets
	FixAliases
}


AddAliasFunction () {
	local file="${srcdir}/rust/compiler/rustc_target/src/spec/mod.rs"

	local line; line="$(
		grep --fixed-strings --line-number "contents })" "${file}" |
		cut --delimiter=":" --fields=1
	)"

	sed --in-place \
		"$((line + 1))d" \
		"${file}"

	# shellcheck disable=SC1003
	sed --in-place \
	-e '/contents })/a\' \
	-e '    }\' \
	-e '\' \
	-e '    /// Creates a target triple from its alias\' \
	-e '    pub fn from_alias(triple: String) -> Self {\' \
	-e '        match triple.as_str() {\' \
	-e '            "x86_64-pc-linux-gnu" => TargetTriple::from_triple("x86_64-unknown-linux-gnu"),\' \
	-e '            "i686-pc-linux-gnu" => TargetTriple::from_triple("i686-unknown-linux-gnu"),\' \
	-e '            _ => TargetTriple::TargetTriple(triple),\' \
	-e '        }\' \
	-e '    }\' \
	"${file}"
}


SelectAliasesAsTargets () {
	sed --in-place \
		"s|::TargetTriple|::from_alias|" \
		"${srcdir}/rust/compiler/rustc_session/src/config.rs"
}


FixAliases () {
	sed --in-place \
		"s|i686-unknown-linux-gnu|i686-pc-linux-gnu|" \
		"${srcdir}/rust/compiler/rustc_target/src/spec/targets/i686_unknown_linux_gnu.rs"

	sed --in-place \
		"s|x86_64-unknown-linux-gnu|x86_64-pc-linux-gnu|" \
		"${srcdir}/rust/compiler/rustc_target/src/spec/targets/x86_64_unknown_linux_gnu.rs"
}


LinkConfig () {
	if [[ ! -L "${srcdir}/rust/config.toml" ]]; then
		ln --symbolic "../config.toml" "${srcdir}/rust/config.toml"
	fi
}


build () {
	local Lock="${srcdir}/build.lock"
	export DESTDIR="${srcdir}/dest-rust"

	if [[ ! -f "${Lock}" ]]; then
		rm --recursive --force "${DESTDIR}"
		Compile
		OrganizeBuild
		touch "${Lock}"
	fi
}


Compile () {
	cd "${srcdir}/rust"
	RUST_BACKTRACE=1 python ./x.py install --jobs "$(nproc)"
}


OrganizeBuild () {
	DeleteUnnecesaryFiles
	LinkLibs
	MoveModules
	MoveLicenses
}


DeleteUnnecesaryFiles () {
	cd "${DESTDIR}"
	rm usr/lib/rustlib/{components,install.log,rust-installer-version,uninstall.sh}
	rm usr/lib/rustlib/manifest-*
}


LinkLibs () {
	cd "${DESTDIR}"
	ln --symbolic --relative --force --target-directory=usr/lib \
		usr/lib/rustlib/x86_64-unknown-linux-gnu/lib/*.so
}


MoveModules () {
	cd "${DESTDIR}"
	MoveModule dest-src  usr/lib/rustlib/src
}


MoveModule () {
	local Module="${1}"
	local File
	local Dir
	shift

	for File; do
		Dir="${srcdir}/${Module}/${File}"
		mkdir --parents "$(dirname "${Dir}")"
		mv "${File}" "${Dir}"
		rmdir --parents --ignore-fail-on-non-empty "$(dirname "${File}")"
	done
}


MoveLicenses () {
	local File
	local FileDir
	local LicensesDir="usr/share/licenses/rust"

	cd "${DESTDIR}"
	mkdir --parents "${LicensesDir}"

	for File in usr/share/doc/*/{COPYRIGHT,LICENSE}*; do
		FileDir="$(dirname "${File}")"

		if [[ "$(basename "${File}")" == "LICENSE-APACHE" ]]; then
			rm "${File}"
		else
			mv "${File}" "${LicensesDir}/${File##*/}.${FileDir##*/}"
		fi

		rmdir --parents --ignore-fail-on-non-empty "${FileDir}"
	done
}


package_rust-git () {
	SetRustVars
	PackageRustContents
}


SetRustVars () {
	pkgdesc="Allows using Rust as programming language"

	provides=(
		"cargo"
		"rust"
		"rustfmt"
	)

	replaces=(
		"cargo"
		"cargo-git"
		"cargo-tree"
		"rust-docs"
		"rust-docs-git"
		"rustfmt"
		"rustfmt-git"
	)

	conflicts=(
		"rust"
		"${replaces[@]}"
	)

	optdepends=(
		'gdb: Allows programing GNU Debbugger scripts'
		'lldb: Allows programing LLVM Debugger scripts'
	)
}


PackageRustContents () {
	cp --archive "${srcdir}/dest-rust"/* "${pkgdir}"
}


package_rust-src-git() {
	SetSrcVars
	PackageModule src
}


SetSrcVars () {
	pkgdesc="Allows compiling Rust"
	arch=("any")
	provides=("rust-src")
	conflicts=("rust-src")
	depends=("rust-git")
}


PackageModule () {
	local Module="${1}"

	cp --archive "${srcdir}/dest-${Module}"/* "${pkgdir}"
	mkdir --parents "${pkgdir}/usr/share/licenses"

	#shellcheck disable=SC2128
	ln --symbolic "rust-git" "${pkgdir}/usr/share/licenses/${pkgname}"
}
