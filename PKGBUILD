# Maintainer: Colin Wallace <wallacoloo@gmail.com>
# Download links to other u-he VSTs can be found here: http://www.kvraudio.com/forum/viewtopic.php?f=31&t=424953
# Note: These VSTs require purchase/activation.

_vstname=Podolski
_vstdir=/usr/lib/vst # Note: these are Linux VSTs (.so files)

pkgname=uhe-podolski-vst
pkgver=3965
pkgrel=3
pkgdesc='Freeware virtual-analog synthesizer from u-he'
arch=('x86_64' 'i686')
url='http://www.u-he.com/cms/podolski'
license=('custom')
depends=('gtk3')
makedepends=('xxd')
_untardir=$_vstname-$pkgver
_tarname=$_untardir.tar.gz
source=("http://uhedownloads.heckmannaudiogmb.netdna-cdn.com/penguin/release/$pkgver/$_tarname")
md5sums=('24e72d1db8c3b22498f4d925dab5d4c9')
install=user.install

_bits=$(echo "$CARCH" | sed "s/x86_64/64/" | sed "s/i686/32/")
_binaryname=$_vstname.$_bits.so


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
    cd "$srcdir/$_untardir/$_vstname"

    # The binaries use a scheme that causes paths to all be ~/.uhe/$_vstname
    # This includes paths to the plugin's own static resources (images, fonts)
    # Patch the binary such that static resources will be loaded from a system dir:
    # Note: these paths can be located in the binary by hand via `strings $_binaryname`
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/Data" "/opt/%3\$s/Data"
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/Modules" "/opt/%3\$s/Modules"
    # This is for accessing the user guide & the dialog binaries
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/" "/opt/%3\$s/"

    # The vst will work OK w/o the presets directory, but it must be manually
    # created if the user wishes to save his/her presets
    # NOTE: mixing positional and non-positional printf arguments like this is
    # against the spec, but doing differently would not meet the length limit
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/Presets/%s" "%s/.local/share/%3\$s"

    # These other directories need to already exist and also be persistent
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/Tunefiles" "%s/.local/share"
    # CCMaps is set via [settings wheel] -> Midi Table
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/CCMaps" "%s/.local/share"
    # Support includes logs & license info
    patch_strings_in_file "$_binaryname" "%s/.%s/%s/Support" "%s/.local/share"
}

package() {
    local instdir=/opt/$_vstname

    cd "$srcdir/$_untardir/$_vstname"
    # Install custom license
    install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"

    # Install the binary and the correct dialog version
    install -D "$_binaryname" "$pkgdir/$instdir/$_binaryname"
    install -D "dialog.$_bits" "$pkgdir/$instdir/dialog.$_bits"
    # Link the binary onto the path
    mkdir -p "$pkgdir/usr/lib/vst"
    ln -s "$instdir/$_binaryname" "$pkgdir/usr/lib/vst/$_vstname.so"

    # Install all the directories (empty directories are required)
    find Data/ Modules/ Presets/ -type d -exec install -dm755 {} $pkgdir/$instdir/{} \;
    # Install all the files
    find Data/ Modules/ Presets/ -type f -exec install -Dm644 {} $pkgdir/$instdir/{} \;
}

# vim: set tabstop=4 shiftwidth=4 expandtab:
