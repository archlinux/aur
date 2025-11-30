declare -a _file_ids=('dedupe' 'dedupe.1' 'dedupe.conf.example')
declare -a _inst_paths=('/usr/bin' '/usr/share/man/man1' '/usr/share/dk15')
srccount=${#_file_ids[@]}
(( myvars )) && return

# how do i force redownloading sources
#(( REDL != 0 )) && rm -f "${_file_ids[@]}"

# Maintainer: Wesley Kennedy <wesley@gmx.it>
pkgname=dedupe
pkgdesc='Earn back file space by hardlinking unchanging duplicate files'
pkgver=20251130 # TYPO'D LAST TIME!!!!
pkgrel=1
arch=(any)
license=(GPL3)
depends=('zsh>=5.9')
optdepends=('b3sum: Faster hashing function') # faulting to b2sum since it's part of coreutils
checkdepends=(curl unzip b3sum zstd)
validpgpkeys=('73311CF24AE4FF33')
#function btoa() { xxd -r -p <<< "$1" | base64; }
#function atob() { base64 -d <<< "$1" | xxd -p; }
source=()
options=()
_root='https://gist.githubusercontent.com/donnaken15/'
_gist_id='f95e8a143bb330fcf7d6268a4d6929e8'
_cmmt_id='f688c40967fec5fe940b491634f7d267203d33d4'
local _tegfunc=b2
local _digsize=512
declare -a sums=()
for (( i = 0; i < srccount; i++ )); do
	local _src="${_root}${_gist_id}/raw/${_cmmt_id}/${_file_ids[$i]}"
	sum="`curl -fsSL --compressed "$_src" | "${_tegfunc}sum" -b`"
	sums+=(${sum:0:$((_digsize>>2))})
	source+=("$_src")
done
eval "${_tegfunc}sums=(${sums[@]})" # forgot, is export not able to do this?

url="${_root}${_gist_id}"
# TODO: create dotload package (when i make other stuff)
source+=("${_root}2e1345bdb44cae19fa395f188fc3bef3/raw/925e9c4c261255b5d60e03668aeeaa878eee031e/dotload")
b2sums+=('a692dc3c77b676a236ba9ec94731318d4d2b048ba0965a9ac7ffbf19b7fd06526de424446fbbdf89f3a5ab0764da5ad8e7221bea4f082d01983c91de9272d534')

homedir='~/.config/dk15/'

install='.INSTALL'
cat <<inst >"$install" # remove cat if possible, *nix is garbage
post_install() {
	echo '[1mTo create a configuration file for yourself, execute:[0m'
	echo '[93m	mkdir -p ${homedir}[0m'
	echo '[93m	cp ${_inst_paths[2]}/${_file_ids[2]} ${homedir}dedupe[0m'
}
inst
clean() { rm -f "$startdir/$install"; }
check() {
	(( CHECK == 0 )) && {
		plain 'Skipping test ($CHECK == 0)'
		return 0 # HACK!!!!
	}
	msg2 'Run test? Requires 1.8GB. This may take a while. (Y/n)'
	local pr; read -r pr; pr="${pr[0]:-y}"
	[ ! "${pr,,}" = "y" ] && return 0
	# TODO: free space check and move to /tmp if no space on device of this file, otherwise quit
	declare -a tests=( # example archive files that would contain dupes
		'https://sourceforge.net/projects/getgnuwin32/files/GetGnuWin32_legacy_install_archive.zip'
		'https://github.com/twitter/twemoji/archive/7f9de7ceb8962c1b505486e23dee24282385b28b.zip' # has .ai files, before adobe was btfo'd
		'https://github.com/jdecked/twemoji/archive/refs/heads/main.zip'
		'https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-win32.zip' # TAKES TOO LONG ON FREAKING WSL
		'https://releases.wikimedia.org/mediawiki/1.42/mediawiki-1.42.3.zip'
		#'https://github.com/ungoogled-software/ungoogled-chromium-windows/releases/download/115.0.5790.171-1.1/ungoogled-chromium_115.0.5790.171-1.1_windows_x64.zip'
	)
	declare -a blinking=(' ' '+')
	declare -a sizes=("180MB -> 397MB" "324MB -> 412MB" "8.55MB -> 12.4MB" "191MB -> 696MB" "99.3MB -> 336MB")
	local tmpzip='./test.zip' tmpdir='./test/' tmpchk='../testchk.zst' compact=0 # not important (right now)
	msg2 'Deleting previous temp data...'
	(rm -rf "$tmpdir" || rm -rf $tmpdir**/*)
	function timefmt() {
		local h m s ms time
		(( h = ((m = (s = (ms = (time = $(("$1")))) / 1000) / 60) / 60) % 60, m %= 60, s %= 60, ms %= 1000 ))
		# wish i could cram this in one statement
		printf '%s%02d:%02d:%02d.%03d' "$2" $h $m $s $ms
	}
	msg 'Downloading and extracting test files...'
	start=`date +%s%3N`
	for (( i = 0; i < ${#tests[@]}; i++ )); do
		local name="`basename "${tests[$i]}"`" out="./test/test$i" blink=1
		local size="`curl -sI "${tests[$i]}" | sed 's/\r//g' | (grep -Ei "^Content-Length: " || echo "Content-Length: -1") | awk '{print $2}'`"
		msg2 "$name (${sizes[$i]})"
		curl -fSLo "$tmpzip" --progress-bar "${tests[$i]}"
		local x=0 estc=`zipinfo -Z1 "$tmpzip" | wc -l` width=$(head -c $((`tput cols` - 8)) < /dev/zero | tr '\0' '-') prog lastprog=0
		set -o pipefail
		mkdir -p "$out"
		unzip -od "$out" "$tmpzip" | while read -r l; do
			(( lastprog != prog )) && {
				(( lastprog = prog, prog = (x*${#width}/estc), 1 ))
				printf "%s%3d%% %s%.*s%s%-*s%s"$'\r' '[97m' \
					$lastprog '[90m[[91;1m' $prog "$width" \
					'[97m>' $((${#width}-prog)) '' '[90;22m][0m'
			}
			(( (prog = (x++*100/estc)) < 100 )) && echo -en "[96m${blinking[blink = ! blink]}\r" || :
			# THIS STUPID BUILD SYSTEM THING IS SO STRICT I CAN'T DO MATH WITHOUT LAST EXPR BEING NONZERO
		done
		(( ! ( PIPESTATUS[0] | PIPESTATUS[1] ) )) && echo '[97mDone'
		(( compact )) && which compact.exe >/dev/null && {
			plain 'Compacting directory...' # FOR WHATEVER REASON
			(pushd "$out" >/dev/null && compact.exe /c /f /s /a /i '*' | tail -3)
		}
		rm -f "$tmpzip"
	done
	plain "Download time: `timefmt "$(date +%s%3N)-start"`"
	msg2 PERMS
	chmod 666 -R "$tmpdir" # GnuWin32 has readonly files that get extracted
	chmod +x dedupe
	msg 'Readying tests...'
	msg2 'Generating hashes of test files...'
	set -o pipefail
	# don't know if this can be set or unset without being typed out even in the middle of this function
	(cd "$tmpdir" && find . -type f -print0 | xargs -0P 10 b2sum -l 128 | zstd -6c --long=26 --single-thread > "$tmpchk") # >6 not so effective in separate testing
	# (ls -R | sha256sum) to see if list changes before and after, but it shouldn't
	export password=alpine test_hash=b3 test_hash_length=24 test_batch_hashes=1 test_hash_workers=8
	msg2 "Configuration: hash=$test_hash, hashlen=$test_hash_length, batch=$test_batch_hashes, hash_workers=$test_hash_workers"
	msg 'Running test commands...'
	msg2 'Simulation run (CRC32, scramble list)'
	start=`date +%s%3N`
	test_simulate_mode=1 test_scramble_list=1 test_passes=1 test_hash=ck zsh -c "./dedupe '$tmpdir**/*'"
	plain "Run time: `timefmt "$(date +%s%3N)-start"`"
	for i in 1 0; do
		msg2 "Run $((2-i)), scramble=$i, sanity=$i, batch=$i, errors=$((i-1)), invalid=0"
		start=`date +%s%3N`; test_scramble_list=$i test_sanity_check=$i test_batch_hashes=$i \
		test_hide_errored=$((1-i)) test_hide_invalid=1 zsh -c "./dedupe '$tmpdir**/*'"
		plain "Run time: `timefmt "$(date +%s%3N)-start"`"
		# second run shouldn't have left over duplicates to process
	done
	msg2 'Run 3 (no scramble, no batching, force relinking, 1 pass)'
	start=`date +%s%3N`
	test_hide_errored=1 test_hide_invalid=1 test_force_relink=1 test_passes=1 test_batch_hashes=0 zsh -c "./dedupe '$tmpdir**/*'"
	plain "Run time: `timefmt "$(date +%s%3N)-start"`"
	msg2 'Done. Run 2 (but also pass 2 of run 1), theoretically, should have no left over files to process.'
	set -o pipefail
	msg 'Verifying file checksums...'
	err='[91m'; rc='[0m'
	# none of the file contents and where they're placed should change ever after grouping duplicates
	echo -n "${err}" 1>&2 # ???
	(cd "$tmpdir" && zstd -dc "$tmpchk" | b2sum --strict -cl 128 1>/dev/null) || abort=1
	echo -n "${rc}" 1>&2
	(( ! ( PIPESTATUS[0] | PIPESTATUS[1] | abort ) )) && msg2 'ALL OK!' || error 'Got at least one checksum mismatch.'
	msg 'Test cleanup'
	echo -n "${err}" 1>&2; (rm -rf "$tmpdir" || rm -rf $tmpdir**/* || exit 0); echo -n "${rc}"
	msg2 'Test done!'
	msg 'View the entire log with:'
	msg2 "./logview '$pkgname-$pkgver-$pkgrel-$HOSTTYPE-check.log'"
	(( ! abort ))
	# print markers for -> messages so user can skip to them
}
package() {
	local myvars=1
	source "$startdir/PKGBUILD"
	local man=1 # file index...
	gzip -9c "$srcdir/${_file_ids[man]}" > "$srcdir/${_file_ids[man]}.gz"
	_file_ids[man]="${_file_ids[man]}.gz"
	for (( i = 0; i < srccount; i++ )); do
		install -Dm444 "$srcdir/${_file_ids[$i]}" "$pkgdir${_inst_paths[$i]}/${_file_ids[$i]}"
	done
	install -Dm444 "$srcdir/dotload" "$pkgdir${_inst_paths[2]}/dotload"
	chmod +x "${pkgdir}${_inst_paths[0]}/${_file_ids[0]}" # oops
}
