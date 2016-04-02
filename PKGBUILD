# Maintainer: Colin Wallace <wallacoloo@gmail.com>
# Download links to other U-he VSTs can be found here: http://www.kvraudio.com/forum/viewtopic.php?f=31&t=418736&sid=0cdc12e0e50a6c55da33d25ea70da706&start=105
# Note: These VSTs require purchase/activation.

vstname=Hive
vstdir=/usr/lib/vst # Note: these are Linux VSTs (.so files)
instdir=/opt/$vstname
bits=64
binaryname=$vstname.$bits.so

pkgname=uhe-hive-vst
pkgver=3965
pkgrel=1
pkgdesc='Virtual-analog synthesizer From u-he'
arch=('x86_64')
url='http://www.u-he.com/cms/hive'
license=('custom')
depends=('cairo')
makedepends=()
untarname=$vstname-$pkgver
tarname=$untarname.tar.gz
source=("http://uhedownloads.heckmannaudiogmb.netdna-cdn.com/penguin/release/$pkgver/$tarname")
md5sums=('6fef511df532bda4e719f01699a1fa47')

function patch_strings_in_file() {
	# Source (Johan Hedin): http://everydaywithlinux.blogspot.com/2012/11/patch-strings-in-binary-files-with-sed.html
	# Slight modification by Colin Wallace to force the pattern to capture the entire line
	# Usage: patch_strings_in_file <file> <pattern> <replacement>
	# replaces all occurances of <pattern> with <replacement> in <file>, padding
	# <replacement> with null characters to match the length
	# Unlike sed or patch, this works on binary files
    local FILE="$1"
    local PATTERN="$2"
    local REPLACEMENT="$3"

    # Find all unique strings in FILE that contain the pattern 
    STRINGS=$(strings ${FILE} | grep "^${PATTERN}$" | sort -u -r)

    if [ "${STRINGS}" != "" ] ; then
        echo "File '${FILE}' contains strings equal to '${PATTERN}':"

        for OLD_STRING in ${STRINGS} ; do
            # Create null terminated ASCII HEX representations of the strings
            OLD_STRING_HEX="$(echo -n ${OLD_STRING} | xxd -g 0 -u -ps -c 256)00"
            NEW_STRING_HEX="$(echo -n ${REPLACEMENT} | xxd -g 0 -u -ps -c 256)00"

            if [ ${#NEW_STRING_HEX} -le ${#OLD_STRING_HEX} ] ; then
                # Pad the replacement string with null terminations so the
                # length matches the original string
                while [ ${#NEW_STRING_HEX} -lt ${#OLD_STRING_HEX} ] ; do
                    NEW_STRING_HEX="${NEW_STRING_HEX}00"
                done

                # Now, replace every occurrence of OLD_STRING with NEW_STRING 
                echo -n "Replacing ${OLD_STRING} with ${REPLACEMENT}... "
                hexdump -ve '1/1 "%.2X"' ${FILE} | \
                sed "s/${OLD_STRING_HEX}/${NEW_STRING_HEX}/g" | \
                xxd -r -p > ${FILE}.tmp
                chmod --reference ${FILE} ${FILE}.tmp
                mv ${FILE}.tmp ${FILE}
                echo "Done!"
            else
                echo "New string '${NEW_STRING}' is longer than old" \
                     "string '${OLD_STRING}'. Skipping."
            fi
        done
    fi
}


build() {
	cd "$srcdir" && tar -xzf $tarname
	cd "$srcdir/$untarname/$vstname"
	# The binaries use a scheme that causes paths to all be ~/.uhe/$vstname
	# This includes paths to the plugin's own static resources (images, fonts)
	# Patch the binary such that static resources will be loaded from a system dir
	# Note: these paths can be located in the binary by hand via `strings $binaryname`
	patch_strings_in_file "$binaryname" "%s/.%s/%s/Data" "$instdir/Data"
	patch_strings_in_file "$binaryname" "%s/.%s/%s/Modules" "$instdir/Modules"
	# Note: the Presets directory remains in the user's directory so that they can save presets
	#patch_strings_in_file "$binaryname" "%s/.%s/%s/Presets" "$instdir/Presets"
	patch_strings_in_file "$binaryname" "%s/.%s/%s/" "$instdir/"
	#patch_strings_in_file "$binaryname" "%s/.%s/%s/Tunefiles" "$instdir/Tunefiles"
	# CCMaps isn't shipped with the binary, nor is it created by the default install.sh, so ignore it
	#patch_strings_in_file "$binaryname" "%s/.%s/%s/CCMaps" "$instdir/CCMaps"
	#patch_strings_in_file "$binaryname" "%s/.%s/%s/Support" "$instdir/Support"
}

package() {
	cd "$srcdir/$untarname/$vstname"
	# Install custom license
	install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

	# Install binary
	install -D $binaryname "$pkgdir/usr/lib/vst/$binaryname"

	# Empty directories ARE needed, so install those first
	find Data/ Modules/ Presets/ Tunefiles/ Support/ -type d -exec install -d {} $pkgdir/$instdir/$file/{} \;
	# Install all the files
	find Data/ Modules/ Presets/ Tunefiles/ Support/ -type f -exec install -Dm644 {} $pkgdir/$instdir/$file/{} \;
}

post_install() {
	echo "$vstname installed; each user who wishes to access the presets must run the following"
	echo "> mkdir -p ~/.u-he/$vstname/ && cp -R $instdir/Presets/ ~/.u-he/$vstname/"
}
