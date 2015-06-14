#ifndef _MATH_H_INCLUDED_
#define _MATH_H_INCLUDED_

#include "destructive_reasoning.h"
#include "variable.h"

/*
 * LIST OF FUNCTIONS
 * sin, cos, tan
 * asin, acos, atan
 * log, ln
 * abs
 */

/**
 * CHECKLIST
 * Interpret basic rpn
 * Implement trig and ln
 * Implement abs
 * Fix negatives
 *
 */

#define PLUS '+'
#define MINUS '-'
#define MULT '*'
#define DIV '/'
#define EXP '^'
#define SIN "s"
#define COS "c"
#define TAN "t"
#define ASIN "S"
#define ACOS "C"
#define ATAN "T"
#define SQRT "q"
#define LN "l"
#define LOG "L"

#define EXP_EVEN_NUMERATOR 1048576.0f

class Math
{
public:
	
	static std::string	infixToRPN(std::string infix);
	static double		evaluateRPN(std::string rpn, double x, bool verbose);
	static void 		appendCurrentNumber(bool negative);

	static double exponential(double base, double exponent, bool verbose);
	
	static std::vector<Variable *> variables;
	
	static void	setVariables(std::vector<Variable *> var);

	static inline bool 	containsTrig(std::string current)
	{
		return (	current == "sin" || current == "cos" || current == "tan" ||
				current == "asin"|| current == "acos"|| current == "atan");
	};
	static inline bool	containsLog(std::string current)
	{
		return (current == "ln" || current == "log");
	};
	static inline bool	containsFunction(std::string current)
	{
		return (current == "abs" || current == "sqrt");
	};
	static inline bool	isOperator(char c)
	{
		return (c=='^'||c=='*'||c=='/'||c=='+'||c=='-');
	}
	static int	isVariable(std::string s);
	
	int			identify(std::string infix, int index);	

	enum Operators {Add, Subtract, Multiply, Divide};

	static std::string currentNum;
	static std::stringstream rpn;
	static std::vector<std::string> stack;
	static char lastChar(const std::string, int);
	static double absolute(double num);
	static bool isNegative(std::string current);

	static std::vector<std::string> insults;

	static std::string colorNames[];
	static int colorValues[];
	static int ANS;
};

typedef struct
{
	double x;
	double y;
}Coordinate;

#endif
