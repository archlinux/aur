# Maintainer: Martin Filion <mordillo98@gmail.com>
pkgname=mhwd-manjaro-bin
pkgname_link=mhwd-manjaro-bin
pkgbase=mhwd-manjaro-bin
pkgver=1
pkgrel=1
pkgdesc="This will download, extract and install the latest needed packages from manjaro to run the mhwd command"
url="https://mirror.csclub.uwaterloo.ca/manjaro/stable/extra/x86_64/"
arch=('any')
license=('GPL')
provides=($pkgname)
conflicts=($pkgname)
depends=('gcc-libs' 'hwinfo')

package() {

CYAN='\033[1;36m'
WHITE='\033[1;37m'
BCK_RED='\033[1;41m'
NC='\033[0m'

# Specify the URL of the MANJARO_GPG_FILE
MANJARO_GPG_URL="https://gitlab.manjaro.org/packages/core/manjaro-keyring/-/raw/master/manjaro.gpg"

# Specify the URL of the directory containing the files
MHWD_URL="https://mirror.csclub.uwaterloo.ca/manjaro/stable/extra/x86_64/"

# Specify the directory where the files will be downloaded and extracted
TARGET_DIRECTORY=${pkgdir}

# Initialize FILE_LIST and V86D_FILE_LIST as empty variables
FILE_LIST=""
V86D_FILE_LIST=""

# Change to the target directory
cd ${TARGET_DIRECTORY}

# Print a blank line
echo

# Print the title
echo -e "${WHITE}MHWD MANJARO INSTALLATION${NC}"

# Print a line of asterisks
echo -e "${WHITE}*************************${NC}"

# Print a blank line
echo

# Import manjaro.gpg if not already installed
if ! gpg --list-keys manjaro >/dev/null 2>&1; then
    echo -e "${CYAN}Importing manjaro.gpg...${NC}"
    echo
    curl -s "$MANJARO_GPG_URL" | gpg --import
    echo
    echo -e "${GREEN}manjaro.gpg imported successfully!${NC}"
else
    echo -e "${GREEN}manjaro.gpg is already installed.${NC}"
fi

echo

printf "${YELLOW}Retrieve list of mhwd-manjaro files...${NC}\n\n"

# Fetch the HTML content of the URL and extract the file names

printf "${CYAN}1) mhwd\n"
FILE_LIST=$(curl -s "$MHWD_URL" | grep -oP 'mhwd[^"]*\.tar\.zst')

printf "${CYAN}2) v86d\n\n${NC}"
V86D_FILE_LIST=$(curl -s "$MHWD_URL" | grep -oP 'v86d[^"]*\.tar\.zst')

# Function to download and extract files
download_and_extract() {
    local FILE_NAME="$1"
    local PGP_FILE_NAME="$FILE_NAME.sig"

    if [[ ! -e "$FILE_NAME" ]]; then
        echo -e "${YELLOW}Downloading $FILE_NAME...${NC}"
        curl -s -O "$MHWD_URL$FILE_NAME" > /dev/null

        echo -e "${YELLOW}Downloading $PGP_FILE_NAME...${NC}"
        curl -s -O "$MHWD_URL$PGP_FILE_NAME" > /dev/null

        echo -e "${GREEN}Verifying $FILE_NAME...${NC}"
        GPG_OUTPUT=$(gpg --verify "$PGP_FILE_NAME" "$FILE_NAME" 2>&1)
        if [[ $GPG_OUTPUT =~ "Good signature" ]]; then
            echo -e "${GREEN}Verification successful!${NC}"
        else
            echo -e "${RED}Verification failed:${NC}"
            echo "$GPG_OUTPUT"
        fi

        echo -e "${GREEN}Extracting $FILE_NAME...${NC}"
        tar -xf "$FILE_NAME" -C "$TARGET_DIRECTORY"
        echo -e "${WHITE}Extraction completed!${NC}"
        echo

        local SIG_FILE="${FILE_NAME}.sig"
        if [[ -e "$SIG_FILE" ]]; then
            rm "$SIG_FILE"
        fi
    fi
}

# Download and extract mhwd*.tar.zst files
for FILE in $FILE_LIST; do
    download_and_extract "$FILE"
done

# Download and extract v86d*.tar.zst files
for FILE in $V86D_FILE_LIST; do
    download_and_extract "$FILE"
done

echo -e "${YELLOW}All files downloaded and extracted.${NC}"

# Clean up downloaded packages
printf "${CYAN}Cleaning up downloaded packages...${NC}"
for FILE in $FILE_LIST $V86D_FILE_LIST; do
    if [[ -e "$FILE" ]]; then
        rm "$FILE"
        printf "."
    fi
done

rm /${pkgdir}/.BUILDINFO	
rm /${pkgdir}/.INSTALL	
rm /${pkgdir}/.MTREE	
rm /${pkgdir}/.PKGINFO	

echo
echo -e "${GREEN}Cleanup completed${NC}"
echo

}

