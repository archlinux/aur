# Maintainer: Jan-Henrik Bruhn <aur@jhbruhn.de>
# Contributor: Max Stabel <max dot stabel03 at gmail dot com>

_ltspice_ver_roman="XVII"
_ltspice_ver="17"

pkgname=ltspice
pkgver=17.20201117.1
pkgrel=1
pkgdesc="SPICE simulator, schematic capture and waveform viewer. Installation based on Field Update Utility."
arch=('x86_64')
url="http://www.linear.com/designtools/software/"
license=('custom')
depends=('wine')
makedepends=('git' 'curl' 'cksfv')

_update_url="https://ltspice.analog.com/fieldsync$_ltspice_ver_roman"

source=("$pkgname.sh"
        "$pkgname-help.sh")
sha256sums=('2a2a222c0264af58913d629d58513ead7230861bbed8638f863e48d4ebfe295a'
            '04fb3968b8572d02a69ee61590c038a9560809160b4c6260ded5f802e9ef859a')
_curl_opts="--silent --connect-timeout 60 --retry 3 --retry-delay 1"

_download_file() {
    file=$1
    crc=$2
        
    _download=true
    # check whether cached file with correct CRC exists
    if [ -s "$pkgname/$file" ]; then
        f_crc=$(cksfv -c "$pkgname/$file" | sed '/^;/d' | awk '{print $2}')
        if [ "$crc" = "$f_crc" ]; then
            _download=false
        fi
    fi

    if [ "$_download" = true ]; then
        mkdir -p "${pkgname}/$(dirname $file)"

        # first try compressed path and decompress
        url="${_update_url}${file}.gz"
        output="$pkgname/$file"
        compressed="${pkgname}/${file}.gz"
        
        curl -f $_curl_opts $url -o $compressed && curlcode=$? || curlcode=$?
        if [ -s "$compressed" ] && [ $curlcode -eq 0 ]; then
            echo "compressed: $output"
            cat $compressed | gunzip > $output
            rm $compressed
        fi 
        # download uncompressed file if compressed was not found
        if [ ! -s "$output" ]; then
            echo "uncompressed: $output"
            url="${_update_url}${file}"
            curl $_curl_opts $url > $output
        fi

        if [ ! -s "$output" ]; then
            echo "Download error: $output"
            return 1
        fi
    fi

}

# initialize a semaphore with a given number of tokens
open_sem(){
    mkfifo pipe-$$
    exec 3<>pipe-$$
    rm pipe-$$
    local i=$1
    for((;i>0;i--)); do
        printf %s 000 >&3
    done
}

# run the given command asynchronously and pop/push tokens
run_with_lock(){
    local x
    # this read waits until there is something to read
    read -u 3 -n 3 x && ((0==x)) || exit $x
    (
     ( "$@"; )
    # push the return code of the command to the semaphore
    printf '%.3d' $? >&3
    )&
}

prepare() {
    mkdir -p $pkgname


    _download_file "/Changelog.txt" ""
}
N=$(($(nproc) * 2))
open_sem $N
build() {
    release_logs="$_update_url/release.log.gz"
    
    curl "$release_logs" | gunzip > ./release.log

    echo "Checking cache and downloading using $N threads."
    for entry in $(cat release.log | sed '/^#/d' | awk '{print $6"/"$8}')
    do
        file=$(echo $entry | awk -F/ '{print $2}' | sed 's/\\/\//g' | tr -d '\n\r')
        file="${file:1}"
        crc=$(echo $entry | awk -F/ '{print $1}')
        # download files from list, checking the CRC (something is still wrong with the CRC it seems)
        run_with_lock _download_file "$file" "$crc"
    done
    
    wait

    echo "Downloaded files."
}

package()
{
    cd "$pkgname"

    # Install License
    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install docs to /usr/share/doc/
    install -Dm644 LTspiceHelp.chm "${pkgdir}/usr/share/doc/${pkgname}/ltspice.chm"

    # Install binary files to /usr/share
    install -m755 -d "$pkgdir/usr/share/$pkgname"
    cp -r * "$pkgdir/usr/share/$pkgname"
    #chmod 755 -R "$pkgdir/usr/share/$pkgname"

    #Install /usr/bin startscript
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/$pkgname-help.sh" "$pkgdir/usr/bin/$pkgname-help"
}

pkgver() {
    cd "$pkgname"
    date=$(cat Changelog.txt | head -n1 | awk '{print $1}')
    count=$(grep -c "$date" Changelog.txt)
    date_format=$(echo $date | awk -F/ '{print "20"$3$1$2}')
    echo "$_ltspice_ver.$date_format.$count"
}
