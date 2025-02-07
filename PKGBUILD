declare -a _file_ids=('dedupe' 'dedupe.1' 'dedupe.conf.example')
declare -a _inst_paths=('/usr/bin' '/usr/share/man/man1' '/usr/share/dk15')
srccount=`seq 0 $((${#_file_ids[@]} - 1))`
[ ${myvars:-0} -ne 0 ] && return

# Maintainer: Wesley Kennedy <wesley@gmx.it>
pkgname='dedupe'
pkgdesc='Earn back file space by hardlinking unchanging duplicate files'
pkgver='20240126'
pkgrel=1
arch=(any)
license=('GPL3')
depends=('zsh>=5.9')
optdepends=('b3sum: Faster hashing function') # faulting to b2sum since it's part of coreutils
checkdepends=('curl' 'unzip' 'b3sum')
validpgpkeys=('73311CF24AE4FF33')
#function btoa() { xxd -r -p <<< "$1" | base64; }
#function atob() { base64 -d <<< "$1" | xxd -p; }
source=()
options=()
_root='https://gist.githubusercontent.com/donnaken15/'
_gist_id='f95e8a143bb330fcf7d6268a4d6929e8'
_cmmt_id='ba580ed64348b6b053a0848ed0d3ed38679a9119'
local _tegfunc=b2
local _digsize=512
declare -a sums=()
for i in $srccount; do
	local _src="${_root}${_gist_id}/raw/${_cmmt_id}/${_file_ids[$i]}"
	sum="`curl -fsSL --compressed "$_src" | "${_tegfunc}sum" -b`"
	sums+=(${sum:0:$(($_digsize>>2))})
	source+=("$_src")
done
eval "${_tegfunc}sums=(${sums[@]})"

url="${_root}${_gist_id}"
# TODO: create dotload package (when i make other stuff)
source+=("${_root}2e1345bdb44cae19fa395f188fc3bef3/raw/925e9c4c261255b5d60e03668aeeaa878eee031e/dotload")
b2sums+=('a692dc3c77b676a236ba9ec94731318d4d2b048ba0965a9ac7ffbf19b7fd06526de424446fbbdf89f3a5ab0764da5ad8e7221bea4f082d01983c91de9272d534')

install='.INSTALL'
check() {
	[ ${CHECK:-0} -eq 0 ] && {
		plain 'Skipping test ($CHECK == 0)'
		return 0 # HACK!!!!
	}
	msg2 'Run test? Requires 1.8GB. This may take a while. (Y/n)'
	local pr
	read -r pr
	pr="${pr[0]:-y}"
	[ ! "${pr,,}" = "y" ] && return 0
	# TODO: free space check and move to /tmp if no space on device of this file, otherwise quit
	msg 'Downloading and extracting test files...'
	declare -a tests=( # example archive files that would contain dupes
		'https://sourceforge.net/projects/getgnuwin32/files/GetGnuWin32_legacy_install_archive.zip'
		'https://github.com/twitter/twemoji/archive/7f9de7ceb8962c1b505486e23dee24282385b28b.zip' # has .ai files, before adobe was btfo'd
		'https://github.com/jdecked/twemoji/archive/refs/heads/main.zip'
		'https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-win32.zip' # TAKES TOO LONG ON FREAKING WSL
		'https://releases.wikimedia.org/mediawiki/1.42/mediawiki-1.42.3.zip'
		#'https://github.com/ungoogled-software/ungoogled-chromium-windows/releases/download/115.0.5790.171-1.1/ungoogled-chromium_115.0.5790.171-1.1_windows_x64.zip'
	)
	declare -a sizes=("180MB -> 397MB" "324MB -> 412MB" "8.55MB -> 12.4MB" "191MB -> 696MB" "99.3MB -> 336MB")
	local testcount="`seq 0 $((${#tests[@]} - 1))`"
	local tmpzip='./test.zip'
	local tmpdir='./test/'
	local tmpchk='../testchk.gz'
	msg2 'Deleting previous temp data...'
	(rm -rf "$tmpdir" || rm -rf $tmpdir**/*)
	for i in $testcount; do
		local name="`basename "${tests[$i]}"`"
		local out="./test/test$i"
		local size="`curl -sI "${tests[$i]}" | sed 's/\r//g' | (grep -Ei "^Content-Length: " || echo "Content-Length: -1") | awk '{print $2}'`"
		msg2 "$name (${sizes[$i]})"
		mkdir -p "$out"
		curl -fSLo "$tmpzip" --progress-bar "${tests[$i]}"
		local x=0
		local estc=`zipinfo -Z1 "$tmpzip" | wc -l`
		local width=$(head -c $((`tput cols` - 8)) < /dev/zero | tr '\0' '-')
		set -o pipefail
		local prog
		local lastprog=0
		unzip -od "$out" "$tmpzip" | while read -r l; do
			prog=$(($x*100/$estc))
			[ $lastprog -ne $prog ] && {
				lastprog=$prog; prog=$(($x*${#width}/$estc))
				printf "%s%3d%% %s%.*s%s%-*s%s"$'\r' '[97m' \
					$lastprog '[90m[[91;1m' $prog "$width" \
					'[97m>' $((${#width}-$prog)) '' '[90;22m][0m'
			}
			x=$((x+1))
		done
		(exit ${PIPESTATUS[0]}) && (exit ${PIPESTATUS[1]}) && echo Done
		rm -f "$tmpzip"
	done
	msg2 PERMS
	chmod 666 -R "$tmpdir" # GnuWin32 has readonly files that get extracted
	chmod +x dedupe
	msg 'Generating hashes of test files...'
	set -o pipefail
	# don't know if this can be set or unset without being
	# typed out even in the middle of this function
	(cd "$tmpdir" && find . -type f -print0 | xargs -P 10 -0 b2sum | gzip -9c > "$tmpchk")
	# (ls -R | sha256sum) to see if list changes before and after, but it shouldn't
	export password=alpine test_hash=b3 test_hash_length=24 test_batch_hashes=1 test_hash_workers=8
	msg 'Running test commands...'
	msg2 'Simulation run'
	test_simulate_mode=1 test_scramble_list=1 zsh -c "./dedupe '$tmpdir**/*'"
	for i in 1 0; do
		msg2 "Run $((2-$i))"
		test_scramble_list=$i test_sanity_check=$i test_batch_hashes=$i \
			test_hide_errored=$((1-$i)) test_hide_invalid=$((1-$i)) \
			zsh -c "./dedupe '$tmpdir**/*'"
		# second run shouldn't have left over duplicates to process
	done
	set -o pipefail
	msg 'Verifying file checksums...'
	# none of the file contents and where they're placed should change ever after grouping duplicates
	echo -n "${err}" 1>&2; (cd "$tmpdir" && gzip -dc "$tmpchk" | b2sum -c 1>/dev/null)
	(exit ${PIPESTATUS[0]}) &&
	(exit ${PIPESTATUS[1]}) &&
		msg2 'ALL OK!' || {
		error 'Got at least one checksum mismatch'
		return 1
	}
	echo -n "${rc}" 1>&2
	msg 'Test cleanup'
	echo -n "${err}" 1>&2; (rm -rf "$tmpdir" || rm -rf $tmpdir**/* || exit 0); echo -n "${rc}"
	msg2 'Test done!'
	msg 'View the entire log with:'
	msg2 "./logview '$pkgname-$pkgver-$pkgrel-$HOSTTYPE-check.log'"
	# print markers for -> messages so user can skip to them
}
package() {
	local myvars=1
	source "$OLDPWD/PKGBUILD"
	local man=1 # file index...
	gzip -9c "$srcdir/${_file_ids[$man]}" > "$srcdir/${_file_ids[$man]}.gz"
	_file_ids[$man]="${_file_ids[$man]}.gz"
	for i in $srccount; do
		install -Dm444 "$srcdir/${_file_ids[$i]}" "$pkgdir${_inst_paths[$i]}/${_file_ids[$i]}"
	done
	install -Dm444 "$srcdir/dotload" "$pkgdir${_inst_paths[2]}/dotload"
	chmod +x "${pkgdir}${_inst_paths[0]}/${_file_ids[0]}" # oops
}

