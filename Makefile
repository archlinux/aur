.PHONY: all

all: clean rebuild srcinfo

rebuild:
	updpkgsums
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src twitch-cli*.tar.*

get-checksum:
	@>&2 echo "Checksum for Linux_x86_64 file"
	@>&2 echo "Checksum link: https://github.com/twitchdev/twitch-cli/releases/download/${VERSION}/checksums.txt"
	@curl -s -L "https://github.com/twitchdev/twitch-cli/releases/download/${VERSION}/checksums.txt" | grep Linux_x86_64 | cut -d' ' -f1
