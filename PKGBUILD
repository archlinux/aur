declare -a _file_ids=('dedupe' 'dedupe.1' 'dedupe.conf.example')
declare -a _inst_paths=('/usr/bin' '/usr/share/man/man1' '/usr/share/dk15')
srccount=$(seq 0 $((${#_file_ids[@]} - 1)))
[ ${myvars:-0} -ne 0 ] && return

# Maintainer: Wesley Kennedy <wesley@gmx.it>
pkgname='dedupe'
pkgdesc='Earn back file space by hardlinking unchanging duplicate files'
pkgver='20240825'
pkgrel=2
arch=(any)
license=('GPL3')
depends=('zsh>=5.9')
optdepends=('b3sum: Faster hashing function') # faulting to b2sum since it's part of coreutils
# throwing in test script to dedupe GnuWin32's files just because
checkdepends=('curl' 'unzip')
validpgpkeys=('73311CF24AE4FF33')
#function btoa() { xxd -r -p <<< "$1" | base64; }
#function atob() { base64 -d <<< "$1" | xxd -p; }
source=()
options=()
_root='https://gist.githubusercontent.com/donnaken15/'
_gist_id='f95e8a143bb330fcf7d6268a4d6929e8'
_cmmt_id='423dab0cd255bbb18b1ff83d7f54cea3390e2623'
local _tegfunc=b2
local _digsize=512
declare -a sums=()
for i in $srccount; do
	local _src="${_root}${_gist_id}/raw/${_cmmt_id}/${_file_ids[$i]}"
	sum="$(curl -fsSL --compressed "$_src" | "${_tegfunc}sum" -b)"
	sums+=(${sum:0:$(($_digsize >> 2))})
	source+=("$_src")
done
eval "${_tegfunc}sums=(${sums[@]})"

url="${_root}${_gist_id}"
# TODO: create dotload package
source+=("${_root}2e1345bdb44cae19fa395f188fc3bef3/raw/92b620197a5415c36b89515bedbc95426a48d365/dotload")
b2sums+=('76b17824ff9a7be66e31583fd7f918654b538a7f758dd561411e2840f385975bb88b8cc263f9976d035bea5c5b3a3cb1a5880f067ea5594ba9bccd704f7badb1')

install=".INSTALL"
check() {
	[ ${CHECK:-0} -eq 0 ] && return 0 # HACK!!!!
	msg2 'Run test? Requires 397MB. This may take a while. (Y/n)'
	read -r pr
	local pr=${pr[0]:-y}
	[ ! ${pr,,} = "y" ] && return 0
	# TODO: free space check and move to /tmp if no space on device of this file, otherwise quit
	declare -a tests=( # example archive files that would contain dupes
		'https://sourceforge.net/projects/getgnuwin32/files/GetGnuWin32_legacy_install_archive.zip'
		#'https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-win32.zip' # TAKES TOO LONG ON FREAKING WSL
		#'https://github.com/ungoogled-software/ungoogled-chromium-windows/releases/download/115.0.5790.171-1.1/ungoogled-chromium_115.0.5790.171-1.1_windows_x64.zip'
	)
	local testcount=$(seq 0 $((${#tests[@]} - 1)))
	msg 'Downloading and extracting test files...'
	local tmpzip='./test.zip'
	local tmpdir='./test/'
	for i in $testcount; do
		local name="$(basename "${tests[$i]}")"
		local out="./test/test$i"
		msg2 "$name"
		mkdir -p "$out"
		curl -fSLo "$tmpzip" --progress-bar "${tests[$i]}"
		local i=0
		local estc=$(zipinfo -Z1 "$tmpzip" | wc -l)
		local width=$(head -c $(($(tput cols) - 8)) < /dev/zero | tr '\0' '-')
		set -o pipefail
		local lastprog=0
		unzip -od "$out" "$tmpzip" | while read -r l; do
			prog=$(($i*100/$estc))
			[ $lastprog -ne $prog ] && {
				lastprog=$prog
				prog=$(($i*${#width}/$estc))
				printf "%3d%% %s%.*s%s%-*s%s"$'\r' $(($i*100/$estc)) \
					'[90m[[91m' $prog "$width" \
					'[97m>' $((${#width}-$prog)) \
					'' '[90m][0m'
			}
			i=$(($i + 1))
		done
		(exit ${PIPESTATUS[0]}) && (exit ${PIPESTATUS[1]}) && echo Done
		rm -f "$tmpzip"
	done
	msg2 'PERMS'
	chmod 777 -R "$tmpdir" # GnuWin32 has readonly files that get extracted
	chmod +x 'dedupe'
	msg2 'Running test command...'
	# need to sandbox config path loading to test different options
	zsh -c "./dedupe $tmpdir**/*(.)"
	msg2 'Test cleanup'
	rm -rf "$tmpdir"
}
package() {
	myvars=1
	source "$OLDPWD/PKGBUILD"
	man=1 # file index...
	gzip -9c "$srcdir/${_file_ids[$man]}" > "$srcdir/${_file_ids[$man]}.gz"
	_file_ids[$man]="${_file_ids[$man]}.gz"
	for i in $srccount; do
		install -Dm744 "$srcdir/${_file_ids[$i]}" "$pkgdir${_inst_paths[$i]}/${_file_ids[$i]}"
	done
	install -Dm444 "$srcdir/dotload" "$pkgdir${_inst_paths[2]}/dotload"
}

