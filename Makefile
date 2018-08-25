DCC = dmd
DFLAGS = -J. -Jlibrary
SRC = $(wildcard *.d)
OBJ = $(SRC:.d=.o)
OUT = psi

.PHONY: all debug release clean

all: debug

debug:   DFLAGS += -gc -debug
release: DFLAGS += -O -release

debug release: $(OUT)

$(OUT): $(OBJ)
	$(DCC) $(DFLAGS) -of$@ $(OBJ)

clean:
	rm -f *~ $(OBJ) $(OUT) trace.{def,log}

%.o: %.d
	$(DCC) $(DFLAGS) -c $<
