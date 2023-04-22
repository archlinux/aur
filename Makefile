.PHONY: all

all: clean rebuild srcinfo

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src chatterino7/ chatterino2-*.pkg.tar.{xz,zst} \
		libcommuni \
		humanize \
		crashpad \
		settings \
		signals \
		serialize \
		rapidjson \
		qtkeychain \
		sanitizers-cmake \
		websocketpp \
		magic_enum \
		miniaudio
