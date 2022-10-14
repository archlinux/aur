install:
	go build -o bin/ncli ncli.go
	cp $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/bin/ncli $${HOME}/.local/bin/
